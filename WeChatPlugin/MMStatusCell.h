//
//  MMStatusCell.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MMStatusCellDelegate.h"

@class MMStatusMediaView;
@class MMStatus;

@interface MMStatusCell : NSTableCellView

@property (weak) IBOutlet NSImageView *profileImageView;
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *tagTextField;
@property (weak) IBOutlet NSTextField *contentTextField;
@property (weak) IBOutlet MMStatusMediaView *mediaView;
@property (weak) MMStatusMediaView *mediaRealView;
@property (weak) IBOutlet NSButton *likeButton;
@property (weak) IBOutlet NSTextField *likeCountTextField;
@property (weak) IBOutlet NSButton *commentButton;
@property (weak) IBOutlet NSTextField *commentCountTextField;

@property (nonatomic, strong, readonly) MMStatus *status;
@property (nonatomic, weak) id<MMStatusCellDelegate> delegate;

@property (strong) IBOutlet NSLayoutConstraint *toTagTextFieldLayoutConstraint;
@property (strong) IBOutlet NSLayoutConstraint *toContentTextFieldLayoutConstraint;

- (void)updateMediaView:(MMStatusMediaView *)mediaView;
- (void)updateViewWithStatus:(MMStatus *)status;

+ (CGFloat)calculateHeightForStatus:(MMStatus *)status inTableView:(NSTableView *)tableView;

@end
