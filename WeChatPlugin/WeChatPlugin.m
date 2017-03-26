//
//  WeChatPlugin.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright (c) 2017年 CorbinChen. All rights reserved.
//

#import "WeChatPlugin.h"
#import "MMTimeLineMainViewController.h"
#import "MMNavigationController.h"
#import "MMTimeLineViewController.h"

#pragma mark - Plugin

@implementation NSBundle (WeChatPlugin)

+ (instancetype)pluginBundle {
    return [NSBundle bundleWithIdentifier:@"com.corbin.WeChatPlugin"];
}

@end

@implementation NSObject (WeChatPlugin)

#pragma mark - MMLogger

+ (void)cb_logWithMMLogLevel:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6 {
    NSLog(@"[%s] %s %s %@", arg2, arg3, arg5, arg6);
}

#pragma mark - MMCGIConfig

- (const struct MMCGIItem *)cb_findItemWithFuncInternal:(int)arg1 {
    struct MMCGIItem *res = (struct MMCGIItem *)[self cb_findItemWithFuncInternal:arg1];
    if (arg1 == kMMCGIWrapTimeLineFunctionId) {
        res = malloc(sizeof(struct MMCGIItem));
        res->_field1 = kMMCGIWrapTimeLineFunctionId;
        res->_field2 = 0;
        res->_field3 = 0;
        res->_field4 = "mmsnstimeline";
        res->_field5 = CBGetClass(MMSnsTimeLineResponse);
        res->_field6 = 1;
        res->_field7 = 2;
        res->_field8 = 0;
    }
    else if (arg1 == kMMCGIWrapHomePageFunctionId) {
        res = malloc(sizeof(struct MMCGIItem));
        res->_field1 = kMMCGIWrapHomePageFunctionId;
        res->_field2 = 0;
        res->_field3 = 0;
        res->_field4 = "mmsnsuserpage";
        res->_field5 = CBGetClass(MMSnsUserPageResponse);
        res->_field6 = 1;
        res->_field7 = 2;
        res->_field8 = 0;
    }
    return res;
}

#pragma mark - AppDelegate

- (void)cb_applicationDidFinishLaunching:(id)arg {
    [self cb_applicationDidFinishLaunching:arg];
    if ([WeChatService(AccountService) canAutoAuth]) {
        [WeChatService(AccountService) AutoAuth];
    }
}

- (NSApplicationTerminateReply)cb_applicationShouldTerminate:(NSApplication *)sender {
    return NSTerminateNow;
}

@end

@implementation NSView (WeChatPlugin)

@end

@implementation NSViewController (WeChatPlugin)

#pragma mark - LeftViewController

- (void)cb_setViewControllers:(NSArray *)vcs {
    MMTimeLineMainViewController *timeLineMainVC = [[CBGetClass(MMTimeLineMainViewController) alloc] initWithNibName:@"MMContactsViewController" bundle:[NSBundle mainBundle]];
    [timeLineMainVC setTitle:[[NSBundle mainBundle] localizedStringForKey:@"Tabbar.Chats" value:@"" table:0x0]];
    
    MMTimeLineViewController *timeLineVC = [[CBGetClass(MMTimeLineViewController) alloc] initWithNibName:@"MMTimeLineViewController" bundle:[NSBundle pluginBundle]];
    MMNavigationController *navVC = [[MMNavigationController alloc] initWithFrame:timeLineVC.view.bounds rootViewController:timeLineVC];
    timeLineMainVC.detailViewController = (id)navVC;

    MMTabbarItem *tabBarItem = [[CBGetClass(MMTabbarItem) alloc] initWithTitle:nil onStateImage:[[NSBundle pluginBundle] imageForResource:@"Tabbar-TimeLine-Selected"] onStateAlternateImage:[[NSBundle pluginBundle] imageForResource:@"Tabbar-TimeLine-Selected-HI"] offStateImage:[[NSBundle pluginBundle] imageForResource:@"Tabbar-TimeLine"] offStateAlternateImage:[[NSBundle pluginBundle] imageForResource:@"Tabbar-TimeLine-HI"]];
    [timeLineMainVC setTabbarItem:tabBarItem];
    
    NSMutableArray *viewControllers = [vcs mutableCopy];
    [viewControllers addObject:timeLineMainVC];
    [self cb_setViewControllers:[viewControllers copy]];
}

@end

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ WeChatPlugin loaded ++++++++");
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    if (CBGetClass(SnsObject) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsObject);
    }
    class_setSuperclass(CBGetClass(MMSnsObject), CBGetClass(SnsObject));
    
    if (CBGetClass(SnsTimeLineRequest) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsTimeLineRequest);
    }
    class_setSuperclass(CBGetClass(MMSnsTimeLineRequest), CBGetClass(SnsTimeLineRequest));
    
    if (CBGetClass(SnsTimeLineResponse) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsTimeLineResponse);
    }
    class_setSuperclass(CBGetClass(MMSnsTimeLineResponse), CBGetClass(SnsTimeLineResponse));
    
    if (CBGetClass(SnsUserPageRequest) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsUserPageRequest);
    }
    class_setSuperclass(CBGetClass(MMSnsUserPageRequest), CBGetClass(SnsUserPageRequest));
    
    if (CBGetClass(SnsUserPageResponse) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsUserPageResponse);
    }
    class_setSuperclass(CBGetClass(MMSnsUserPageResponse), CBGetClass(SnsUserPageResponse));
    
#pragma GCC diagnostic pop
    CBRegisterClass(MMContactsViewController, MMTimeLineMainViewController);
    
    CBHookClassMethod(MMLogger, @selector(logWithMMLogLevel:module:file:line:func:message:), @selector(cb_logWithMMLogLevel:module:file:line:func:message:));
    
    CBHookInstanceMethod(MMCGIConfig, @selector(findItemWithFuncInternal:), @selector(cb_findItemWithFuncInternal:));
    
    CBHookInstanceMethod(AppDelegate, @selector(applicationDidFinishLaunching:), @selector(cb_applicationDidFinishLaunching:));
    CBHookInstanceMethod(AppDelegate, @selector(applicationShouldTerminate:), @selector(cb_applicationShouldTerminate:));
    
    CBHookInstanceMethod(LeftViewController, @selector(setViewControllers:), @selector(cb_setViewControllers:));
}
