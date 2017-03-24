//
//  MMStatusCell.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MMStatusMediaView;
@class MMStatus;

@interface MMStatusCell : NSTableCellView

@property (weak) IBOutlet NSImageView *profileImageView;
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *tagTextField;
@property (weak) IBOutlet NSTextField *contentTextField;
@property (weak) IBOutlet MMStatusMediaView *mediaView;
@property (weak) MMStatusMediaView *mediaRealView;

@property (nonatomic, strong, readonly) MMStatus *status;

@property (weak) IBOutlet NSLayoutConstraint *toTagTextFieldLayoutConstraint;
@property (weak) IBOutlet NSLayoutConstraint *toContentTextFieldLayoutConstraint;

- (void)updateViewWithStatus:(MMStatus *)status;

+ (CGFloat)calculateHeightForStatus:(MMStatus *)status inTableView:(NSTableView *)tableView;

@end
