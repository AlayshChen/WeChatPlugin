//
//  MMNavigationController.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMNavigationController.h"
#import <BFViewController.h>
#import <NSView+BFUtilities.h>
#import "MMNavigationBar.h"

static const CGFloat kPushPopAnimationDuration = 0.2;
static const CGFloat kNavigationBarHeight = 40;

@interface MMNavigationController ()

@end

@implementation MMNavigationController

- (id)initWithFrame:(NSRect)frame rootViewController:(NSViewController *)controller {
    self = [super initWithFrame:frame rootViewController:controller];
    if (self) {
        MMNavigationBar *navigationBar = [[MMNavigationBar alloc] initWithFrame:[self navigationBarFrame]];
        navigationBar.autoresizingMask = [self navigationBarAutoresizingMask];
        navigationBar.backButton.hidden = true;
        navigationBar.backButton.target = self;
        navigationBar.backButton.action = @selector(onClickNavigationBarBackButton);
        [navigationBar updateTitle:controller.title];
        
        _navigationBar = navigationBar;
        [self.view addSubview:navigationBar];
        
        for (NSViewController *viewController in self.viewControllers) {
            viewController.view.frame = [self containerViewFrame];
            viewController.view.autoresizingMask = [self containerViewAutoresizingMask];
        }
    }
    return self;
}

- (void)_navigateFromViewController:(NSViewController *)lastController
                   toViewController:(NSViewController *)newController
                           animated:(BOOL)animated
                               push:(BOOL)push
{
    self.navigationBar.backButton.hidden = self.viewControllers.count == 1;
    [self.navigationBar updateTitle:newController.title];
    
    newController.view.autoresizingMask = [self containerViewAutoresizingMask];
    
    // Call delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]) {
        [self.delegate navigationController:self willShowViewController:newController animated:animated];
    }
    
    // New controller will appear
    if ([newController respondsToSelector:@selector(viewWillAppear:)]) {
        [(id<BFViewController>)newController viewWillAppear:animated];
    }
    
    // Last controller will disappear
    if ([lastController respondsToSelector:@selector(viewWillDisappear:)]) {
        [(id<BFViewController>)lastController viewWillDisappear:animated];
    }
    
    NSRect newControllerStartFrame = [self containerViewFrame];
    NSRect lastControllerEndFrame = [self containerViewFrame];
    
    // Completion inline Block
    void(^navigationCompleted)(BOOL) = ^(BOOL animated) {
        // Call delegate
        if (self.delegate && [self.delegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]) {
            [self.delegate navigationController:self didShowViewController:newController animated:animated];
        }
        
        // New controller did appear
        if ([newController respondsToSelector: @selector(viewDidAppear:)]) {
            [(id<BFViewController>)newController viewDidAppear:animated];
        }
        
        // Last controller did disappear
        if ([lastController respondsToSelector: @selector(viewDidDisappear:)]) {
            [(id<BFViewController>)lastController viewDidDisappear:animated];
        }
    };
    
    if (animated) {
        newControllerStartFrame.origin.x = push ? newControllerStartFrame.size.width : -newControllerStartFrame.size.width;
        lastControllerEndFrame.origin.x = push ? -lastControllerEndFrame.size.width : lastControllerEndFrame.size.width;
        
        // Assign start frame
        newController.view.frame = newControllerStartFrame;
        
        // Remove last controller from superview
        [lastController.view removeFromSuperview];
        
        // We use NSImageViews to cache animating views. Of course we could animate using Core Animation layers - Do it if you like that.
        NSImageView *lastControllerImageView = [[NSImageView alloc] initWithFrame:[self containerViewFrame]];
        NSImageView *newControllerImageView = [[NSImageView alloc] initWithFrame:newControllerStartFrame];
        
        [lastControllerImageView setImage:[lastController.view flattenWithSubviews]];
        [newControllerImageView setImage:[newController.view flattenWithSubviews]];
        
        [self.view addSubview: lastControllerImageView];
        [self.view addSubview: newControllerImageView];
        
        // Animation 'block' - Using default timing function
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:kPushPopAnimationDuration];
        [[lastControllerImageView animator] setFrame:lastControllerEndFrame];
        [[newControllerImageView animator] setFrame:[self containerViewFrame]];
        [NSAnimationContext endGrouping];
        
        // Could have just called setCompletionHandler: on animation context if it was Lion only.
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, kPushPopAnimationDuration * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            [lastControllerImageView removeFromSuperview];
            [self.view replaceSubview:newControllerImageView with:newController.view];
            newController.view.frame = [self containerViewFrame];
            navigationCompleted(animated);
        });
    } else {
        newController.view.frame = newControllerStartFrame;
        [self.view addSubview:newController.view];
        [lastController.view removeFromSuperview];
        navigationCompleted(animated);
    }
}

#pragma mark - Action

- (void)onClickNavigationBarBackButton {
    [self popViewControllerAnimated:true];
}

#pragma mark - Frame

- (NSRect)navigationBarFrame {
    NSRect frame = self.view.bounds;
    frame.origin.y = frame.size.height - kNavigationBarHeight;
    frame.size.height = kNavigationBarHeight;
    return frame;
}

- (NSRect)containerViewFrame {
    NSRect frame = self.view.bounds;
    frame.size.height -= kNavigationBarHeight;
    return frame;
}

#pragma mark - AutoresizingMask

- (NSAutoresizingMaskOptions)navigationBarAutoresizingMask {
    return NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable;
}

- (NSAutoresizingMaskOptions)containerViewAutoresizingMask {
    return NSViewMinXMargin | NSViewMaxXMargin | NSViewWidthSizable | NSViewHeightSizable;
}

@end
