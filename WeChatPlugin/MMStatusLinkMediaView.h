//
//  MMStatusLinkMediaView.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusMediaView.h"

@class MMScaleFillImageView;

@interface MMStatusLinkMediaView : MMStatusMediaView

@property (weak) IBOutlet MMScaleFillImageView *iconImageView;
@property (weak) IBOutlet NSTextField *titleTextField;

@end
