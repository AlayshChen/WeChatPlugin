//
//  MMHomePageMgr.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMHomePageMgrDelegate.h"

@class MMStatus;

@interface MMHomePageMgr : NSObject

@property (nonatomic, strong) NSString *usrname;
@property (nonatomic, weak) id<MMHomePageMgrDelegate> delegate;

- (void)updateHomePageHead;
- (void)updateHomePageTail;

- (NSUInteger)getHomePageStatusCount;
- (MMStatus *)getHomePageStatusAtIndex:(NSUInteger)index;

@end
