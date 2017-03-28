//
//  MMSnsCommentInfo.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMSnsCommentInfo.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wincomplete-implementation"

@implementation MMSnsCommentInfo

+ (instancetype)parseFromData:(NSData *)data {
    MMSnsCommentInfo *object = [[CBGetClass(MMSnsCommentInfo) alloc] init];
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
            case 10: {
                [self SetUsername:[input readString]];
                break;
            }
            case 18:{
                [self SetNickname:[input readString]];
                break;
            }
            case 24: {
                [self SetSource:[input readUInt32]];
                break;
            }
            case 32: {
                [self SetType:[input readUInt32]];
                break;
            }
            case 42: {
                [self SetContent:[input readString]];
                break;
            }
            case 48: {
                [self SetCreateTime:[input readUInt32]];
                break;
            }
            case 56: {
                [self SetCommentId:[input readInt32]];
                break;
            }
            case 64: {
                [self SetReplyCommentId:[input readInt32]];
                break;
            }
            case 74: {
                [self SetReplyUsername:[input readString]];
                break;
            }
            case 80: {
                [self SetIsNotRichText:[input readUInt32]];
                break;
            }
            case 88: {
                [self SetReplyCommentId2:[input readUInt64]];
                break;
            }
            case 96: {
                [self SetCommentId2:[input readUInt64]];
                break;
            }
            case 104: {
                [self SetDeleteFlag:[input readUInt32]];
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
