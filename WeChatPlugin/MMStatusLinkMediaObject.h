//
//  MMStatusLinkMediaObject.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusMediaObject.h"

@interface MMStatusLinkMediaObject : MMStatusMediaObject

@property (nonatomic, strong) NSString *imageURLString;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *linkURLString;

@end
