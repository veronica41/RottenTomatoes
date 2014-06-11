//
//  RTMoviewTableViewCell.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTMoviewTableViewCell.h"

@implementation RTMoviewTableViewCell

@synthesize textLabel = _textLabel;
@synthesize detailTextLabel = _detailTextLabel;
@synthesize imageView = _imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _detailTextLabel.numberOfLines = 0;
        NSDictionary *views = NSDictionaryOfVariableBindings(_textLabel, _detailTextLabel, _imageView);
        for (UIView * view in views.allValues) {
            [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        }
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[_imageView]-(16)-[_textLabel]-(16)-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(16)-[_imageView]-(16)-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(16)-[_textLabel]-(16)-[_detailTextLabel]-(>=16)-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:views]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
