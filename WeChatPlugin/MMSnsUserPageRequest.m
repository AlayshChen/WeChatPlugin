//
//  MMSnsUserPageRequest.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMSnsUserPageRequest.h"
#import "PBUtility.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wincomplete-implementation"

@implementation MMSnsUserPageRequest

+ (void)load {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    if (CBGetClass(SnsUserPageRequest) == nil) {
        CBRegisterClass(PBGeneratedMessage, SnsUserPageRequest);
    }
    class_setSuperclass(CBGetClass(MMSnsUserPageRequest), CBGetClass(SnsUserPageRequest));
#pragma GCC diagnostic pop
}

- (int)serializedSize {
    __block SInt32 size_ = 0;
    size_ += computeMessageSize(1, self.baseRequest);
    size_ += computeStringSize(2, self.firstPageMd5);
    size_ += computeStringSize(3, self.username);
    size_ += computeInt64Size(4, self.maxId);
    size_ += computeInt32Size(5, self.source);
    size_ += computeInt64Size(6, self.minFilterId);
    size_ += computeInt32Size(7, self.lastRequestTime);
    return size_;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)stream {
    [stream writeMessage:1 value:self.baseRequest];
    [stream writeString:2 value:self.firstPageMd5];
    [stream writeString:3 value:self.username];
    [stream writeUInt64:4 value:self.maxId];
    [stream writeUInt64:5 value:self.source];
    [stream writeUInt64:6 value:self.minFilterId];
    [stream writeUInt32:7 value:self.lastRequestTime];
}

- (id)serializedData {
    NSMutableData *data = [NSMutableData dataWithLength:[self serializedSize]];
    PBCodedOutputStream *stream = [CBGetClass(PBCodedOutputStream) streamWithData:data];
    [self writeToCodedOutputStream:stream];
    return data;
}

@end

#pragma GCC diagnostic pop
