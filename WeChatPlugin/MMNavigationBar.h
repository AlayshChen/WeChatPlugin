//
//  MMNavigationBar.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MMNavigationBar : NSView

@property (nonatomic, weak) NSButton *backButton;
@property (nonatomic, weak) NSTextField *titleTextField;
@property (nonatomic, weak) NSView *lineView;

- (void)updateTitle:(NSString *)title;

@end
