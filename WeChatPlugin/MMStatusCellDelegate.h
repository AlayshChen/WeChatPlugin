//
//  MMStatusCellDelegate.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/25.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMStatusCell;

@protocol MMStatusCellDelegate <NSObject>

@optional
- (void)cell:(MMStatusCell *)cell didClick:(MMStatus *)status;
- (void)cell:(MMStatusCell *)cell didClickUser:(NSString *)usrname;
- (void)cell:(MMStatusCell *)cell didClickImage:(NSImage *)image imageFilePath:(NSString *)filePath;
- (void)cell:(MMStatusCell *)cell didClickMediaLink:(NSString *)url;

@end
