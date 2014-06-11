//
//  RTMoviesViewController.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTMoviesViewController.h"
#import "RTDetailViewController.h"
#import "RTMoviewTableViewCell.h"
#import "RTMovie.h"
#import "RTImageHelper.h"
#import "RTAlertBar.h"

@interface RTMoviesViewController ()

@property (nonatomic) RTMoviesViewControllerType type;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) __block NSMutableArray * movies;
@property (nonatomic, strong) NSString * moviesUrl;

@property (nonatomic, strong) UIRefreshControl * refreshControl;
@property (nonatomic, strong) MBProgressHUD * hud;
@property (nonatomic, retain) RTAlertBar * alertBar;

@end

@implementation RTMoviesViewController


- (id)initWithType:(RTMoviesViewControllerType)type {
    if (self = [super init]) {
        _type = type;
        if (_type == RTMoviesViewControllerTypeBoxOffice) {
            _moviesUrl = BOX_OFFICE_URL;
        } else if (_type == RTMoviesViewControllerTypeTopDVDs) {
            _moviesUrl = TOP_DVDS_URL;
        }

        self.navigationItem.title = MOVIES_VIEW_TITLE;
        [self updateMovies];
    }
    return self;
}

- (void)loadView {
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [_tableView setRowHeight:MOVIES_TABLE_ROW_HEIGHT];
    _tableView.clipsToBounds = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    self.view = _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // pull to refresh
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(updateMovies) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:_refreshControl];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MovieTableCell";
    
    RTMoviewTableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[RTMoviewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        RTMovie * movie = [_movies objectAtIndex:indexPath.row];
        cell.textLabel.text = movie.title;
        cell.detailTextLabel.text = movie.synopsis;
        [RTImageHelper setImageWithURL:movie.posterProfileUrl placeHolderImage:nil forView:cell.imageView];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // go to detail view
    RTMovie * movie = [_movies objectAtIndex:indexPath.row];
    UITableViewCell * cell = [_tableView cellForRowAtIndexPath:indexPath];
    // pass in low resolution image
    UIImage * posterImage = cell.imageView.image;
    RTDetailViewController * detailViewController = [[RTDetailViewController alloc] initWithMovie:movie posterImage:posterImage];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)updateMovies {
    // cleanup
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if (_alertBar) {
        [_alertBar removeFromSuperview];
    }

    // display loading state
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading";
	_hud.delegate = self;

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_moviesUrl]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_hud hide:YES];
                [_refreshControl endRefreshing];

                // display network error alert bar
                _alertBar = [[RTAlertBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 48) title:connectionError.localizedDescription];
                [self.view addSubview:_alertBar];
            });
        } else {
            NSError * error;
            NSDictionary * results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_hud hide:YES];
                    [_refreshControl endRefreshing];
                });
                NSLog(@"Error parsing JSON: %@", error);
            } else {
                _movies = [NSMutableArray array];
                NSArray * moviesArray = results[@"movies"];
                for (NSDictionary * movieDict in moviesArray) {
                    RTMovie * movie = [[RTMovie alloc] init];
                    movie.title = movieDict[@"title"];
                    movie.synopsis = movieDict[@"synopsis"];
                    // low resolution
                    movie.posterProfileUrl = movieDict[@"posters"][@"profile"];
                    // high resolution
                    movie.posterOriginalUrl = movieDict[@"posters"][@"original"];
                    [_movies addObject:movie];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_hud hide:YES];
                    [_refreshControl endRefreshing];
                    [_tableView reloadData];
                });
            }
        }
    }];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
	[_hud removeFromSuperview];
	_hud = nil;
}

@end
