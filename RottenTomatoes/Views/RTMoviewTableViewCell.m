//
//  RTMoviewTableViewCell.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTMoviewTableViewCell.h"
#import "RTImageHelper.h"

@implementation RTMoviewTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect frame = CGRectMake(16, 16, 62, 92);
        [self.imageView setFrame:frame];
        self.imageView.image = [RTImageHelper placeHolderImageWithFrame:frame Color:[UIColor colorWithWhite:1 alpha:0.5]];
        self.detailTextLabel.numberOfLines = 4;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
