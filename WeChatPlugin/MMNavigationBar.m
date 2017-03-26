//
//  MMNavigationBar.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMNavigationBar.h"

@implementation MMNavigationBar

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self initView];
        [self initConstraint];
    }
    return self;
}

- (void)initView {
    self.wantsLayer = true;
    self.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    NSTextField *titleTextField = [[NSTextField alloc] init];
    titleTextField.font = [NSFont systemFontOfSize:16];
    titleTextField.textColor = [NSColor blackColor];
    titleTextField.alignment = NSTextAlignmentCenter;
    titleTextField.editable = false;
    titleTextField.bezeled = false;
    _titleTextField = titleTextField;
    [self addSubview:titleTextField];
    
    NSView *lineView = [[NSView alloc] init];
    lineView.wantsLayer = true;
    lineView.layer.backgroundColor = [NSColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1.0].CGColor;
    _lineView = lineView;
    [self addSubview:lineView];
    
    NSButton *backButton = [NSButton buttonWithImage:[NSImage imageNamed:@"NSGoLeftTemplate"] target:nil action:nil];
    backButton.bordered = false;
    backButton.bezelColor = [NSColor blackColor];
    _backButton = backButton;
    [self addSubview:backButton];
}

- (void)initConstraint {
    self.titleTextField.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleTextField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    self.lineView.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineView(1)]|" options:0 metrics:nil views:@{@"lineView": self.lineView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[lineView]|" options:0 metrics:nil views:@{@"lineView": self.lineView}]];
    
    self.backButton.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[backButton]" options:0 metrics:nil views:@{@"backButton": self.backButton}]];
}

- (void)updateTitle:(NSString *)title {
    self.titleTextField.stringValue = title;
    [self.titleTextField sizeToFit];
}

@end
