//
//  MMStatusImageMediaView.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusMediaView.h"

@interface MMStatusImageMediaView : MMStatusMediaView

@property (weak) IBOutlet NSImageView *imageView0;
@property (weak) IBOutlet NSImageView *imageView1;
@property (weak) IBOutlet NSImageView *imageView2;
@property (weak) IBOutlet NSImageView *imageView3;
@property (weak) IBOutlet NSImageView *imageView4;
@property (weak) IBOutlet NSImageView *imageView5;
@property (weak) IBOutlet NSImageView *imageView6;
@property (weak) IBOutlet NSImageView *imageView7;
@property (weak) IBOutlet NSImageView *imageView8;

@property (nonatomic, strong, readonly) NSArray *imageViews;

@end
