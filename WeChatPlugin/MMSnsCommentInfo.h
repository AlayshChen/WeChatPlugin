//
//  MMSnsCommentInfo.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsCommentInfo : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x00000001004196a8
@property(nonatomic, setter=SetDeleteFlag:) unsigned int deleteFlag; // @synthesize deleteFlag;
@property(readonly, nonatomic) BOOL hasDeleteFlag; // @synthesize hasDeleteFlag;
@property(nonatomic, setter=SetCommentId2:) unsigned long long commentId2; // @synthesize commentId2;
@property(readonly, nonatomic) BOOL hasCommentId2; // @synthesize hasCommentId2;
@property(nonatomic, setter=SetReplyCommentId2:) unsigned long long replyCommentId2; // @synthesize replyCommentId2;
@property(readonly, nonatomic) BOOL hasReplyCommentId2; // @synthesize hasReplyCommentId2;
@property(nonatomic, setter=SetIsNotRichText:) unsigned int isNotRichText; // @synthesize isNotRichText;
@property(readonly, nonatomic) BOOL hasIsNotRichText; // @synthesize hasIsNotRichText;
@property(retain, nonatomic, setter=SetReplyUsername:) NSString *replyUsername; // @synthesize replyUsername;
@property(readonly, nonatomic) BOOL hasReplyUsername; // @synthesize hasReplyUsername;
@property(nonatomic, setter=SetReplyCommentId:) int replyCommentId; // @synthesize replyCommentId;
@property(readonly, nonatomic) BOOL hasReplyCommentId; // @synthesize hasReplyCommentId;
@property(nonatomic, setter=SetCommentId:) int commentId; // @synthesize commentId;
@property(readonly, nonatomic) BOOL hasCommentId; // @synthesize hasCommentId;
@property(nonatomic, setter=SetCreateTime:) unsigned int createTime; // @synthesize createTime;
@property(readonly, nonatomic) BOOL hasCreateTime; // @synthesize hasCreateTime;
@property(retain, nonatomic, setter=SetContent:) NSString *content; // @synthesize content;
@property(readonly, nonatomic) BOOL hasContent; // @synthesize hasContent;
@property(nonatomic, setter=SetType:) unsigned int type; // @synthesize type;
@property(readonly, nonatomic) BOOL hasType; // @synthesize hasType;
@property(nonatomic, setter=SetSource:) unsigned int source; // @synthesize source;
@property(readonly, nonatomic) BOOL hasSource; // @synthesize hasSource;
@property(retain, nonatomic, setter=SetNickname:) NSString *nickname; // @synthesize nickname;
@property(readonly, nonatomic) BOOL hasNickname; // @synthesize hasNickname;
@property(retain, nonatomic, setter=SetUsername:) NSString *username; // @synthesize username;
@property(readonly, nonatomic) BOOL hasUsername; // @synthesize hasUsername;
//- (void).cxx_destruct;	// IMP=0x0000000100419cd2
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x0000000100419737
- (int)serializedSize;	// IMP=0x00000001004193a0
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x0000000100419025
- (BOOL)isInitialized;	// IMP=0x0000000100418fd4
- (id)init;	// IMP=0x0000000100418c41

@end
