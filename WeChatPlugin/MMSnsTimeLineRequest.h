//
//  MMSnsTimeLineRequest.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsTimeLineRequest : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x0000000100423ed3
@property(retain, nonatomic, setter=SetSession:) SKBuiltinBuffer_t *session; // @synthesize session;
@property(readonly, nonatomic) BOOL hasSession; // @synthesize hasSession;
@property(nonatomic, setter=SetClientLatestId:) unsigned long long clientLatestId; // @synthesize clientLatestId;
@property(readonly, nonatomic) BOOL hasClientLatestId; // @synthesize hasClientLatestId;
@property(nonatomic, setter=SetLastRequestTime:) unsigned int lastRequestTime; // @synthesize lastRequestTime;
@property(readonly, nonatomic) BOOL hasLastRequestTime; // @synthesize hasLastRequestTime;
@property(nonatomic, setter=SetMinFilterId:) unsigned long long minFilterId; // @synthesize minFilterId;
@property(readonly, nonatomic) BOOL hasMinFilterId; // @synthesize hasMinFilterId;
@property(nonatomic, setter=SetMaxId:) unsigned long long maxId; // @synthesize maxId;
@property(readonly, nonatomic) BOOL hasMaxId; // @synthesize hasMaxId;
@property(retain, nonatomic, setter=SetFirstPageMd5:) NSString *firstPageMd5; // @synthesize firstPageMd5;
@property(readonly, nonatomic) BOOL hasFirstPageMd5; // @synthesize hasFirstPageMd5;
@property(retain, nonatomic, setter=SetBaseRequest:) BaseRequest *baseRequest; // @synthesize baseRequest;
@property(readonly, nonatomic) BOOL hasBaseRequest; // @synthesize hasBaseRequest;
//- (void).cxx_destruct;	// IMP=0x000000010042430c
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x0000000100423f62
- (int)serializedSize;	// IMP=0x0000000100423d11
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x0000000100423b08
- (BOOL)isInitialized;	// IMP=0x0000000100423a2c
- (id)init;	// IMP=0x0000000100423811

+ (instancetype)request;

@end
