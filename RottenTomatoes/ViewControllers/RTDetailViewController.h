//
//  RTDetailViewController.h
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTMovie.h"

@interface RTDetailViewController : UIViewController

- (id)initWithMovie:(RTMovie *)movie posterImage:(UIImage *)image;

@end
