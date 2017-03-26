//
//  MMSnsUserPageRequest.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSnsUserPageRequest : NSObject

+ (id)parseFromData:(id)arg1;	// IMP=0x00000001006b0d42
@property(nonatomic, setter=SetLastRequestTime:) unsigned int lastRequestTime; // @synthesize lastRequestTime;
@property(readonly, nonatomic) BOOL hasLastRequestTime; // @synthesize hasLastRequestTime;
@property(nonatomic, setter=SetMinFilterId:) unsigned long long minFilterId; // @synthesize minFilterId;
@property(readonly, nonatomic) BOOL hasMinFilterId; // @synthesize hasMinFilterId;
@property(nonatomic, setter=SetSource:) unsigned int source; // @synthesize source;
@property(readonly, nonatomic) BOOL hasSource; // @synthesize hasSource;
@property(nonatomic, setter=SetMaxId:) unsigned long long maxId; // @synthesize maxId;
@property(readonly, nonatomic) BOOL hasMaxId; // @synthesize hasMaxId;
@property(retain, nonatomic, setter=SetUsername:) NSString *username; // @synthesize username;
@property(readonly, nonatomic) BOOL hasUsername; // @synthesize hasUsername;
@property(retain, nonatomic, setter=SetFirstPageMd5:) NSString *firstPageMd5; // @synthesize firstPageMd5;
@property(readonly, nonatomic) BOOL hasFirstPageMd5; // @synthesize hasFirstPageMd5;
@property(retain, nonatomic, setter=SetBaseRequest:) BaseRequest *baseRequest; // @synthesize baseRequest;
@property(readonly, nonatomic) BOOL hasBaseRequest; // @synthesize hasBaseRequest;
//- (void).cxx_destruct;	// IMP=0x00000001006b10eb
- (id)mergeFromCodedInputStream:(id)arg1;	// IMP=0x00000001006b0dd1
- (int)serializedSize;	// IMP=0x00000001006b0b81
- (void)writeToCodedOutputStream:(id)arg1;	// IMP=0x00000001006b0979
- (BOOL)isInitialized;	// IMP=0x00000001006b0900
- (id)init;	// IMP=0x00000001006b06de

@end
