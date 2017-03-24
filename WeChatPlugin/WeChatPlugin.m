//
//  WeChatPlugin.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright (c) 2017年 CorbinChen. All rights reserved.
//

#import "WeChatPlugin.h"
#import "WeChatPluginHeader.h"

#pragma mark - Plugin

@implementation NSObject (WeChatPlugin)

@end

@implementation NSView (WeChatPlugin)

@end

@implementation NSViewController (WeChatPlugin)

@end

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ WeChatPlugin loaded ++++++++");
}