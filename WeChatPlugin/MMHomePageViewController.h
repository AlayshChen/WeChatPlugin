//
//  MMHomePageViewController.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MMHomePageViewController : NSViewController

@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) WCContactData *contact;

@end
