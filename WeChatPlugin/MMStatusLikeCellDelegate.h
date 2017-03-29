//
//  MMStatusLikeCellDelegate.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMStatusLikeCell;

@protocol MMStatusLikeCellDelegate <NSObject>

@optional
- (void)cell:(MMStatusLikeCell *)cell didClickLikeUser:(NSString *)usrname;

@end
