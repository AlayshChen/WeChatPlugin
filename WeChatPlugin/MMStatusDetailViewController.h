//
//  MMStatusDetailViewController.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MMStatusDetailViewController : NSViewController

@property (weak) IBOutlet NSTableView *tableView;
@property (nonatomic, strong) MMStatus *status;

@end
