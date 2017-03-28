//
//  MMStatus.h
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MMStatusMediaObjectType) {
    MMStatusMediaObjectTypeNone,
    MMStatusMediaObjectTypeImage,
    MMStatusMediaObjectTypeLink,
};

@class MMStatusMediaObject;

@interface MMStatus : NSObject

@property (nonatomic, assign) NSUInteger statusId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profileImageURLString;
@property (nonatomic, strong) NSString *nameString;
@property (nonatomic, strong) NSString *timeString;
@property (nonatomic, strong) NSString *sourceString;
@property (nonatomic, strong) NSAttributedString *contentAttributedString;
@property (nonatomic, assign) MMStatusMediaObjectType mediaType;
@property (nonatomic, strong) MMStatusMediaObject *mediaObject;
@property (nonatomic, assign) NSUInteger likeCount;
@property (nonatomic, assign) NSUInteger commentCount;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, strong) NSArray *likeList;
@property (nonatomic, strong) NSArray *commentList;

- (void)updateWithSnsObject:(MMSnsObject *)snsObject;

- (BOOL)hasSource;
- (BOOL)hasContent;
- (BOOL)hasMediaObject;

@end
