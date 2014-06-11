//
//  RTAlertBar.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTAlertBar.h"

@implementation RTAlertBar {
    UILabel * label;
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)title {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        label = [[UILabel alloc] initWithFrame:frame];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:title];
        [self addSubview:label];
    }
    return self;
}

@end
