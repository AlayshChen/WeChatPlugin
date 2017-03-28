
//
//  MMStatusLikeCellItem.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusLikeCellItem.h"

@interface MMStatusLikeCellItem ()

@end

@implementation MMStatusLikeCellItem

- (void)awakeFromNib {
    [super awakeFromNib];
    self.profileImageView.wantsLayer = true;
    self.profileImageView.layer.cornerRadius = 20;
    self.profileImageView.layer.masksToBounds = true;
}

@end
