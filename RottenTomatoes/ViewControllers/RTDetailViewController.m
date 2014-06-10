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

@end

@implementation RTDetailViewController

- (id)initWithMovie:(RTMovie *)movie {
    if (self = [super init]) {
        _movie = movie;
        self.navigationItem.title = movie.title;
        
        // setup left navigation bar button
        UIBarButtonItem *  backButton = [[UIBarButtonItem alloc] initWithTitle:MOVIES_VIEW_TITLE style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonHandler:)];
        self.navigationItem.backBarButtonItem = backButton;
    }
    return self;
}

- (void)loadView {
    self.view = [[RTDetailView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] movie:_movie];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonHandler:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
