//
//  MMTimeLineMgr.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMTimeLineMgrDelegate.h"

@class MMStatus;

@interface MMTimeLineMgr : NSObject

@property (nonatomic, weak) id<MMTimeLineMgrDelegate> delegate;

- (void)updateTimeLineHead;
- (void)updateTimeLineTail;

- (NSUInteger)getTimeLineStatusCount;
- (MMStatus *)getTimeLineStatusAtIndex:(NSUInteger)index;

@end
