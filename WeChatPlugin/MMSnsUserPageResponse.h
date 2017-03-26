//
//  MMSnsUserPageResponse.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsUserPageResponse : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x00000001006b1d09
@property(retain, nonatomic, setter=SetServerConfig:) SnsServerConfig *serverConfig; // @synthesize serverConfig;
@property(readonly, nonatomic) BOOL hasServerConfig; // @synthesize hasServerConfig;
@property(nonatomic, setter=SetObjectCountForSameMd5:) unsigned int objectCountForSameMd5; // @synthesize objectCountForSameMd5;
@property(readonly, nonatomic) BOOL hasObjectCountForSameMd5; // @synthesize hasObjectCountForSameMd5;
@property(nonatomic, setter=SetNewRequestTime:) unsigned int newRequestTime; // @synthesize newRequestTime;
@property(readonly, nonatomic) BOOL hasNewRequestTime; // @synthesize hasNewRequestTime;
//@property(retain, nonatomic, setter=SetSnsUserInfo:) SnsUserInfo *snsUserInfo; // @synthesize snsUserInfo;
@property(readonly, nonatomic) BOOL hasSnsUserInfo; // @synthesize hasSnsUserInfo;
@property(nonatomic, setter=SetObjectTotalCount:) unsigned int objectTotalCount; // @synthesize objectTotalCount;
@property(readonly, nonatomic) BOOL hasObjectTotalCount; // @synthesize hasObjectTotalCount;
@property(retain, nonatomic) NSMutableArray *mutableObjectListList; // @synthesize mutableObjectListList;
@property(nonatomic, setter=SetObjectCount:) unsigned int objectCount; // @synthesize objectCount;
@property(readonly, nonatomic) BOOL hasObjectCount; // @synthesize hasObjectCount;
@property(retain, nonatomic, setter=SetFirstPageMd5:) NSString *firstPageMd5; // @synthesize firstPageMd5;
@property(readonly, nonatomic) BOOL hasFirstPageMd5; // @synthesize hasFirstPageMd5;
@property(retain, nonatomic, setter=SetBaseResponse:) BaseResponse *baseResponse; // @synthesize baseResponse;
@property(readonly, nonatomic) BOOL hasBaseResponse; // @synthesize hasBaseResponse;
//- (void).cxx_destruct;	// IMP=0x00000001006b2371
- (void)addObjectList:(id)arg1;	// IMP=0x00000001006b2112
- (void)addObjectListFromArray:(id)arg1;	// IMP=0x00000001006b203f
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x00000001006b1d98
- (int)serializedSize;	// IMP=0x00000001006b19ee
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x00000001006b166b
- (BOOL)isInitialized;	// IMP=0x00000001006b144f
@property(retain, nonatomic) NSMutableArray *objectList; // @dynamic objectList;
- (id)objectListList;	// IMP=0x00000001006b12d6
- (id)init;	// IMP=0x00000001006b112d

@end
