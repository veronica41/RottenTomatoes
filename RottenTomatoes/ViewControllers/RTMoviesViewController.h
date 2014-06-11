//
//  RTMoviesViewController.h
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

typedef enum {
    RTMoviesViewControllerTypeBoxOffice = 0,
    RTMoviesViewControllerTypeTopDVDs   = 1
} RTMoviesViewControllerType;

@interface RTMoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate>

- (id)initWithType:(RTMoviesViewControllerType)type;

@end
