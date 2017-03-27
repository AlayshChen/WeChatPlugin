//
//  MMStatusImageMediaView.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusMediaView.h"
@class MMScaleFillImageView;

@interface MMStatusImageMediaView : MMStatusMediaView

@property (weak) IBOutlet MMScaleFillImageView *imageView0;
@property (weak) IBOutlet MMScaleFillImageView *imageView1;
@property (weak) IBOutlet MMScaleFillImageView *imageView2;
@property (weak) IBOutlet MMScaleFillImageView *imageView3;
@property (weak) IBOutlet MMScaleFillImageView *imageView4;
@property (weak) IBOutlet MMScaleFillImageView *imageView5;
@property (weak) IBOutlet MMScaleFillImageView *imageView6;
@property (weak) IBOutlet MMScaleFillImageView *imageView7;
@property (weak) IBOutlet MMScaleFillImageView *imageView8;

@property (nonatomic, strong, readonly) NSArray *imageViews;

@end
