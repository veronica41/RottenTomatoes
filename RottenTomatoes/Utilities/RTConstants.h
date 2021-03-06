//
//  RTConstants.h
//  RottenTomatoes
//
//  Created by Veronica Zheng on 6/10/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#ifndef RottenTomatoes_Header_h
#define RottenTomatoes_Header_h

#define MOVIES_TABLE_ROW_HEIGHT 120


#pragma mark - strings

#define BOX_OFFICE_TAB_BAR_TITLE @"Box Office"
#define TOP_DVDS_TAB_BAR_TITLE @"Top DVDs"
#define MOVIES_VIEW_TITLE @"Movies"


#pragma mark - images

#define IMAGE_REQUEST_TIMEOUT 60
#define BOX_OFFICE_TAB_BAR_IMAGE @"box_office_tab"
#define TOP_DVDS_TAB_BAR_IMAGE @"top_dvds_tab"


#pragma mark - urls

#define BOX_OFFICE_URL @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=g9au4hv6khv6wzvzgt55gpqs"
#define TOP_DVDS_URL @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs"


#pragma mark - cache

#define MEMORY_CAPACITY 4*1024*1024 //4M
#define DISK_CAPACITY 32*1024*1024  //32M
#define DISK_CACHE_PATH @"rotten_tomatoes_cache"

#endif
