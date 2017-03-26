//
//  MMSnsTimeLineResponse.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsTimeLineResponse : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x00000001004253bf
@property(retain, nonatomic, setter=SetSession:) SKBuiltinBuffer_t *session; // @synthesize session;
@property(readonly, nonatomic) BOOL hasSession; // @synthesize hasSession;
@property(retain, nonatomic) NSMutableArray *mutableAdvertiseListList; // @synthesize mutableAdvertiseListList;
@property(nonatomic, setter=SetAdvertiseCount:) unsigned int advertiseCount; // @synthesize advertiseCount;
@property(readonly, nonatomic) BOOL hasAdvertiseCount; // @synthesize hasAdvertiseCount;
@property(retain, nonatomic, setter=SetServerConfig:) SnsServerConfig *serverConfig; // @synthesize serverConfig;
@property(readonly, nonatomic) BOOL hasServerConfig; // @synthesize hasServerConfig;
@property(nonatomic, setter=SetControlFlag:) unsigned int controlFlag; // @synthesize controlFlag;
@property(readonly, nonatomic) BOOL hasControlFlag; // @synthesize hasControlFlag;
@property(nonatomic, setter=SetObjectCountForSameMd5:) unsigned int objectCountForSameMd5; // @synthesize objectCountForSameMd5;
@property(readonly, nonatomic) BOOL hasObjectCountForSameMd5; // @synthesize hasObjectCountForSameMd5;
@property(nonatomic, setter=SetNewRequestTime:) unsigned int newRequestTime; // @synthesize newRequestTime;
@property(readonly, nonatomic) BOOL hasNewRequestTime; // @synthesize hasNewRequestTime;
@property(retain, nonatomic) NSMutableArray *mutableObjectListList; // @synthesize mutableObjectListList;
@property(nonatomic, setter=SetObjectCount:) unsigned int objectCount; // @synthesize objectCount;
@property(readonly, nonatomic) BOOL hasObjectCount; // @synthesize hasObjectCount;
@property(retain, nonatomic, setter=SetFirstPageMd5:) NSString *firstPageMd5; // @synthesize firstPageMd5;
@property(readonly, nonatomic) BOOL hasFirstPageMd5; // @synthesize hasFirstPageMd5;
@property(retain, nonatomic, setter=SetBaseResponse:) BaseResponse *baseResponse; // @synthesize baseResponse;
@property(readonly, nonatomic) BOOL hasBaseResponse; // @synthesize hasBaseResponse;
//- (void).cxx_destruct;	// IMP=0x0000000100425d52
- (void)addAdvertiseList:(id)arg1;	// IMP=0x0000000100425a8d
- (void)addAdvertiseListFromArray:(id)arg1;	// IMP=0x00000001004259ba
- (void)addObjectList:(id)arg1;	// IMP=0x00000001004258e0
- (void)addObjectListFromArray:(id)arg1;	// IMP=0x000000010042580d
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x000000010042544e
- (int)serializedSize;	// IMP=0x0000000100424f70
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x0000000100424a97
- (BOOL)isInitialized;	// IMP=0x0000000100424766
@property(retain, nonatomic) NSMutableArray *advertiseList; // @dynamic advertiseList;
- (id)advertiseListList;	// IMP=0x0000000100424675
@property(retain, nonatomic) NSMutableArray *objectList; // @dynamic objectList;
- (id)objectListList;	// IMP=0x0000000100424518
- (id)init;	// IMP=0x000000010042434e

@end
