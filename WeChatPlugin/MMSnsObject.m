//
//  MMSnsObject.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMSnsObject.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wincomplete-implementation"

@implementation MMSnsObject

+ (void)load {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    if (CBGetClass(SnsObject) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsObject);
    }
    class_setSuperclass(CBGetClass(MMSnsObject), CBGetClass(SnsObject));
#pragma GCC diagnostic pop
}

+ (instancetype)parseFromData:(NSData *)data {
    MMSnsObject *object = [[CBGetClass(MMSnsObject) alloc] init];
    [object mergeFromData:data];
    return object;
}

- (id)mergeFromData:(NSData *)data {
    PBCodedInputStream *stream = [CBGetClass(PBCodedInputStream) streamWithData:data];
    return [self mergeFromCodedInputStream:stream];
}

- (id)mergeFromCodedInputStream:(PBCodedInputStream *)input {
    while (true) {
        SInt32 tag = [input readTag];
        switch (tag) {
            case 0:
                return self;
                break;
            case 8: {
                if (self.hasId) {
                    [input skipField:tag];
                }
                else {
                    [self SetId:[input readUInt64]];
                    _hasId = true;
                }
            }
                break;
            case 18: {
                if (self.hasUsername) {
                    [input skipField:tag];
                }
                else {
                    [self SetUsername:[input readString]];
                    _hasUsername = true;
                }
                break;
            }
            case 26: {
                [self SetNickname:[input readString]];
                break;
            }
            case 32: {
                [self SetCreateTime:[input readUInt32]];
                break;
            }
            case 42: {
                SKBuiltinBuffer_t *buff = [[CBGetClass(SKBuiltinBuffer_t) alloc] init];
                [input readMessage:buff];
                [self SetObjectDesc:buff];
                break;
            }
            case 48: {
                [self SetLikeFlag:[input readUInt32]];
                break;
            }
            case 56: {
                [self SetLikeCount:[input readUInt32]];
                break;
            }
            case 64: {
                [self SetLikeUserListCount:[input readUInt32]];
                break;
            }
            case 74: {
                [input skipField:tag];
                break;
            }
            case 0x50: {
                [self SetCommentCount:[input readUInt32]];
                break;
            }
            case 0x58: {
                [self SetCommentUserListCount:[input readUInt32]];
                break;
            }
            case 0x68: {
                [self SetWithUserCount:[input readUInt32]];
                break;
            }
            case 0x70: {
                [self SetWithUserListCount:[input readUInt32]];
                break;
            }
            default:
                [input skipField:tag];
                break;
        }
    }
}

@end

#pragma GCC diagnostic pop
