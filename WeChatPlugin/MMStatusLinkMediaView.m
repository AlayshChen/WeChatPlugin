//
//  MMStatusLinkMediaView.m
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusLinkMediaView.h"
#import "MMScaleFillImageView.h"

@implementation MMStatusLinkMediaView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.wantsLayer = true;
    self.layer.backgroundColor = [NSColor colorWithWhite:0.9 alpha:1.0].CGColor;
    self.iconImageView.layer.backgroundColor = [NSColor colorWithWhite:0.9 alpha:1.0].CGColor;
}

@end
