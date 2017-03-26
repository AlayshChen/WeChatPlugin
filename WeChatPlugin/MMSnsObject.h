//
//  MMSnsObject.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsObject : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x000000010041c5a4
@property(retain, nonatomic) NSMutableArray *mutableGroupUserList; // @synthesize mutableGroupUserList;
@property(nonatomic, setter=SetGroupUserCount:) unsigned int groupUserCount; // @synthesize groupUserCount;
@property(readonly, nonatomic) BOOL hasGroupUserCount; // @synthesize hasGroupUserCount;
@property(nonatomic, setter=SetDeleteFlag:) unsigned int deleteFlag; // @synthesize deleteFlag;
@property(readonly, nonatomic) BOOL hasDeleteFlag; // @synthesize hasDeleteFlag;
@property(retain, nonatomic) NSMutableArray *mutableBlackListList; // @synthesize mutableBlackListList;
@property(nonatomic, setter=SetBlackListCount:) unsigned int blackListCount; // @synthesize blackListCount;
@property(readonly, nonatomic) BOOL hasBlackListCount; // @synthesize hasBlackListCount;
@property(nonatomic, setter=SetReferId:) unsigned long long referId; // @synthesize referId;
@property(readonly, nonatomic) BOOL hasReferId; // @synthesize hasReferId;
@property(retain, nonatomic, setter=SetReferUsername:) NSString *referUsername; // @synthesize referUsername;
@property(readonly, nonatomic) BOOL hasReferUsername; // @synthesize hasReferUsername;
@property(nonatomic, setter=SetIsNotRichText:) unsigned int isNotRichText; // @synthesize isNotRichText;
@property(readonly, nonatomic) BOOL hasIsNotRichText; // @synthesize hasIsNotRichText;
@property(retain, nonatomic) NSMutableArray *mutableGroupListList; // @synthesize mutableGroupListList;
@property(nonatomic, setter=SetGroupCount:) unsigned int groupCount; // @synthesize groupCount;
@property(readonly, nonatomic) BOOL hasGroupCount; // @synthesize hasGroupCount;
@property(nonatomic, setter=SetNoChange:) unsigned int noChange; // @synthesize noChange;
@property(readonly, nonatomic) BOOL hasNoChange; // @synthesize hasNoChange;
@property(nonatomic, setter=SetExtFlag:) unsigned int extFlag; // @synthesize extFlag;
@property(readonly, nonatomic) BOOL hasExtFlag; // @synthesize hasExtFlag;
@property(retain, nonatomic) NSMutableArray *mutableWithUserListList; // @synthesize mutableWithUserListList;
@property(nonatomic, setter=SetWithUserListCount:) unsigned int withUserListCount; // @synthesize withUserListCount;
@property(readonly, nonatomic) BOOL hasWithUserListCount; // @synthesize hasWithUserListCount;
@property(nonatomic, setter=SetWithUserCount:) unsigned int withUserCount; // @synthesize withUserCount;
@property(readonly, nonatomic) BOOL hasWithUserCount; // @synthesize hasWithUserCount;
@property(retain, nonatomic) NSMutableArray *mutableCommentUserListList; // @synthesize mutableCommentUserListList;
@property(nonatomic, setter=SetCommentUserListCount:) unsigned int commentUserListCount; // @synthesize commentUserListCount;
@property(readonly, nonatomic) BOOL hasCommentUserListCount; // @synthesize hasCommentUserListCount;
@property(nonatomic, setter=SetCommentCount:) unsigned int commentCount; // @synthesize commentCount;
@property(readonly, nonatomic) BOOL hasCommentCount; // @synthesize hasCommentCount;
@property(retain, nonatomic) NSMutableArray *mutableLikeUserListList; // @synthesize mutableLikeUserListList;
@property(nonatomic, setter=SetLikeUserListCount:) unsigned int likeUserListCount; // @synthesize likeUserListCount;
@property(readonly, nonatomic) BOOL hasLikeUserListCount; // @synthesize hasLikeUserListCount;
@property(nonatomic, setter=SetLikeCount:) unsigned int likeCount; // @synthesize likeCount;
@property(readonly, nonatomic) BOOL hasLikeCount; // @synthesize hasLikeCount;
@property(nonatomic, setter=SetLikeFlag:) unsigned int likeFlag; // @synthesize likeFlag;
@property(readonly, nonatomic) BOOL hasLikeFlag; // @synthesize hasLikeFlag;
@property(retain, nonatomic, setter=SetObjectDesc:) SKBuiltinBuffer_t *objectDesc; // @synthesize objectDesc;
@property(readonly, nonatomic) BOOL hasObjectDesc; // @synthesize hasObjectDesc;
@property(nonatomic, setter=SetCreateTime:) unsigned int createTime; // @synthesize createTime;
@property(readonly, nonatomic) BOOL hasCreateTime; // @synthesize hasCreateTime;
@property(retain, nonatomic, setter=SetNickname:) NSString *nickname; // @synthesize nickname;
@property(readonly, nonatomic) BOOL hasNickname; // @synthesize hasNickname;
@property(retain, nonatomic, setter=SetUsername:) NSString *username; // @synthesize username;
@property(readonly, nonatomic) BOOL hasUsername; // @synthesize hasUsername;
@property(nonatomic, setter=SetId:) unsigned long long id; // @synthesize id=id_;
@property(readonly, nonatomic) BOOL hasId; // @synthesize hasId;
//- (void).cxx_destruct;	// IMP=0x000000010041dc71
- (void)addGroupUser:(id)arg1;	// IMP=0x000000010041d6ce
- (void)addGroupUserFromArray:(id)arg1;	// IMP=0x000000010041d5fb
- (void)addBlackList:(id)arg1;	// IMP=0x000000010041d521
- (void)addBlackListFromArray:(id)arg1;	// IMP=0x000000010041d44e
- (void)addGroupList:(id)arg1;	// IMP=0x000000010041d374
- (void)addGroupListFromArray:(id)arg1;	// IMP=0x000000010041d2a1
- (void)addWithUserList:(id)arg1;	// IMP=0x000000010041d1c7
- (void)addWithUserListFromArray:(id)arg1;	// IMP=0x000000010041d0f4
- (void)addCommentUserList:(id)arg1;	// IMP=0x000000010041d01a
- (void)addCommentUserListFromArray:(id)arg1;	// IMP=0x000000010041cf47
- (void)addLikeUserList:(id)arg1;	// IMP=0x000000010041ce6d
- (void)addLikeUserListFromArray:(id)arg1;	// IMP=0x000000010041cd9a
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x000000010041c633
- (int)serializedSize;	// IMP=0x000000010041bb32
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x000000010041af81
- (BOOL)isInitialized;	// IMP=0x000000010041a971
@property(retain, nonatomic) NSMutableArray *groupUser; // @dynamic groupUser;
- (id)groupUserList;	// IMP=0x000000010041a8b8
@property(retain, nonatomic) NSMutableArray *blackList; // @dynamic blackList;
- (id)blackListList;	// IMP=0x000000010041a7c9
@property(retain, nonatomic) NSMutableArray *groupList; // @dynamic groupList;
- (id)groupListList;	// IMP=0x000000010041a686
@property(retain, nonatomic) NSMutableArray *withUserList; // @dynamic withUserList;
- (id)withUserListList;	// IMP=0x000000010041a57c
@property(retain, nonatomic) NSMutableArray *commentUserList; // @dynamic commentUserList;
- (id)commentUserListList;	// IMP=0x000000010041a48d
@property(retain, nonatomic) NSMutableArray *likeUserList; // @dynamic likeUserList;
- (id)likeUserListList;	// IMP=0x000000010041a39e
- (id)init;	// IMP=0x0000000100419fcf

@end
