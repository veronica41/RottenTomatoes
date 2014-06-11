//
//  RTDetailViewController.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTDetailViewController.h"
#import "RTDetailView.h"

@interface RTDetailViewController ()

@property (nonatomic, strong) RTMovie * movie;
// low resolution image
@property (nonatomic, strong) UIImage * posterImage;

@end

@implementation RTDetailViewController

- (id)initWithMovie:(RTMovie *)movie posterImage:(UIImage *)image {
    if (self = [super init]) {
        _movie = movie;
        _posterImage = image;
        self.navigationItem.title = movie.title;
        
        // setup left navigation bar button
        UIBarButtonItem *  backButton = [[UIBarButtonItem alloc] initWithTitle:MOVIES_VIEW_TITLE style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonHandler:)];
        self.navigationItem.backBarButtonItem = backButton;
    }
    return self;
}

- (void)loadView {
    self.view = [[RTDetailView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] movie:_movie posterImage:(UIImage *)_posterImage];
}

- (void)leftBarButtonHandler:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
