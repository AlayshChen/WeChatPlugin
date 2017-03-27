//
//  MMScaleFillImageView.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/27.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMScaleFillImageView.h"

@implementation MMScaleFillImageView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initLayer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self initLayer];
    }
    return self;
}

- (void)initLayer {
    self.layer = [[CALayer alloc] init];
    self.layer.contentsGravity = kCAGravityResizeAspectFill;
    self.layer.masksToBounds = true;
    self.wantsLayer = YES;
}

#pragma mark - 

- (void)setImage:(NSImage *)image {
    self.layer.contents = image;
}

- (NSImage *)image {
    id contents = self.layer.contents;
    if ([contents isMemberOfClass:[NSImage class]]) {
        return (NSImage *)contents;
    }
    else {
        return nil;
    }
}

@end
