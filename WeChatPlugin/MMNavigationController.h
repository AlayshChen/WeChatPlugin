//
//  MMNavigationController.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <BFNavigationController/BFNavigationController.h>
@class MMNavigationBar;

@interface MMNavigationController : BFNavigationController

@property (nonatomic, weak, readonly) MMNavigationBar *navigationBar;

@end
