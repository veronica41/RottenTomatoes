//
//  RTImageHelper.m
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RTImageHelper.h"
#import "UIImageView+AFNetworking.h"

@implementation RTImageHelper

+ (void)setImageWithURL:(NSString *)url placeHolderImage:(UIImage *)placeHolderImage forView:(UIImageView *)imageView {
     NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:IMAGE_REQUEST_TIMEOUT];
     [imageView setImageWithURLRequest:request
                       placeholderImage:placeHolderImage
                                success:nil
                                failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                  
     }];
}
@end
