//
//  MMStatusCommentCell.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MMStatusComment;

@interface MMStatusCommentCell : NSTableCellView

@property (weak) IBOutlet NSImageView *profileImageView;
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *timeTextField;
@property (weak) IBOutlet NSTextField *contentTextField;

- (void)updateViewWithComment:(MMStatusComment *)comment;
+ (CGFloat)calculateHeightForComment:(MMStatusComment *)comment withWidth:(CGFloat)width;

@end
