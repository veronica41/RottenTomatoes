//
//  RTMovie.h
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTMovie : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * synopsis;
@property (nonatomic, strong) NSString * posterProfileUrl;
@property (nonatomic, strong) NSString * posterOriginalUrl;

@end
