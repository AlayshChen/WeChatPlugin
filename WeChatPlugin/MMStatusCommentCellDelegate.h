//
//  MMStatusCommentCellDelegate.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMStatusCommentCell;

@protocol MMStatusCommentCellDelegate <NSObject>

@optional
- (void)cell:(MMStatusCommentCell *)cell didClickCommentUser:(NSString *)usrname;

@end
