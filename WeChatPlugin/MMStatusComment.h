//
//  MMStatusComment.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMStatusComment : NSObject

@property (nonatomic, assign) NSUInteger commentId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profileImageURLString;
@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) NSAttributedString *contentAttributedString;

- (BOOL)hasContent;
- (void)updateWithCommentInfo:(MMSnsCommentInfo *)commentInfo;

@end
