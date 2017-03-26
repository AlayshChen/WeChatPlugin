//
//  MMSnsUserPageResponse.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMSnsUserPageResponse.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wincomplete-implementation"

@implementation MMSnsUserPageResponse

+ (instancetype)parseFromData:(NSData *)data {
    MMSnsUserPageResponse *response = [[CBGetClass(MMSnsUserPageResponse) alloc] init];
    [response mergeFromData:data];
    return response;
}

- (id)mergeFromData:(NSData *)data {
    PBCodedInputStream *stream = [CBGetClass(PBCodedInputStream) streamWithData:data];
    [self mergeFromCodedInputStream:stream];
    return self;
}

- (id)mergeFromCodedInputStream:(PBCodedInputStream *)input {
    while (true) {
        SInt32 tag = [input readTag];
        switch (tag) {
            case 0:
                return self;
                break;
            case 10: {
                BaseResponse *response = [[CBGetClass(BaseResponse) alloc] init];
                [input readMessage:response];
                [self SetBaseResponse:response];
                _hasBaseResponse = true;
            }
                break;
            case 18: {
                [self SetFirstPageMd5:[input readString]];
                _hasFirstPageMd5 = true;
                break;
            }
            case 24: {
                [self SetObjectCount:[input readInt32]];
                _hasObjectCount = true;
                break;
            }
            case 34: {
                MMSnsObject *object = [[CBGetClass(MMSnsObject) alloc] init];
                [input readMessage:object];
                [self addObjectList:object];
                break;
            }
            default:
                [input skipField:tag];
                break;
        }
    }
}

- (void)addObjectList:(id)arg1 {
    NSMutableArray *list = [self mutableObjectListList];
    if (list == nil) {
        list = [NSMutableArray new];
        [self setMutableObjectListList:list];
    }
    [list addObject:arg1];
    self.objectList = list.copy;
}

@end

#pragma GCC diagnostic pop
