//
//  RTDetailView.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTDetailView.h"
#import "RTImageHelper.h"

static CGFloat _contentWidth;

@implementation RTDetailView {
    RTMovie * _movie;
    UIImageView * _backgroundView;

    // for overlay
    UIScrollView * _scrollView;
    UIView * _overlayView;
    UILabel * _titleLabel;
    UILabel * _synopsisLabel;
}

+ (void)initialize {
    _contentWidth = [[UIScreen mainScreen] applicationFrame].size.width - 16;
}

- (id)initWithFrame:(CGRect)frame movie:(RTMovie *)movie posterImage:(UIImage *)posterImage {
    self = [super initWithFrame:frame];
    if (self) {
        _movie = movie;
        
        _backgroundView = [[UIImageView alloc] init];
        [RTImageHelper setImageWithURL:movie.posterOriginalUrl placeHolderImage:posterImage forView:_backgroundView];
        [self addSubview:_backgroundView];

        _scrollView = [[UIScrollView alloc] init];
        [self addSubview:_scrollView];

        _overlayView = [[UIView alloc] init];
        _overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [_scrollView addSubview:_overlayView];
        [_scrollView setContentOffset:CGPointMake(0, 0)];

        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = movie.title;
        _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        _titleLabel.textColor = [UIColor whiteColor];
        [_overlayView addSubview:_titleLabel];

        _synopsisLabel = [[UILabel alloc] init];
        _synopsisLabel.text = movie.synopsis;
        _synopsisLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
        _synopsisLabel.textColor = [UIColor whiteColor];
        _synopsisLabel.numberOfLines = 0;
        [_overlayView addSubview:_synopsisLabel];

        NSDictionary *views = NSDictionaryOfVariableBindings(_backgroundView, _scrollView, _overlayView, _titleLabel, _synopsisLabel);
        for (UIView * view in views.allValues) {
            [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        }
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundView]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundView]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(200)-[_overlayView(>=480)]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_overlayView(==320)]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(32)-[_titleLabel]-(32)-[_synopsisLabel]-(>=32)-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[_titleLabel]-(16)-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[_synopsisLabel]-(16)-|" options:0 metrics:nil views:views]];
     }
    return self;
}

@end
