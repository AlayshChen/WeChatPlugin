//
//  MMSnsTimeLineRequest.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMSnsTimeLineRequest.h"
#import "PBUtility.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wincomplete-implementation"

@implementation MMSnsTimeLineRequest

+ (void)load {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
    CBRegisterClass(PBGeneratedMessage, SnsTimeLineRequest);
    class_setSuperclass([MMSnsTimeLineRequest class], CBGetClass(SnsTimeLineRequest));
#pragma GCC diagnostic pop
}

- (int)serializedSize {
    __block SInt32 size_ = 0;
    size_ += computeMessageSize(1, self.baseRequest);
    size_ += computeStringSize(2, self.firstPageMd5);
    size_ += computeInt64Size(3, self.maxId);
    size_ += computeInt64Size(4, self.minFilterId);
    size_ += computeInt32Size(5, self.lastRequestTime);
    size_ += computeInt64Size(6, self.clientLatestId);
    size_ += computeMessageSize(7, self.session);
    return size_;
}

- (void)writeToCodedOutputStream:(PBCodedOutputStream *)stream {
    [stream writeMessage:1 value:[self baseRequest]];
    [stream writeString:2 value:[self firstPageMd5]];
    [stream writeUInt64:3 value:[self maxId]];
    [stream writeUInt64:4 value:[self minFilterId]];
    [stream writeUInt32:5 value:[self lastRequestTime]];
    [stream writeUInt64:6 value:[self clientLatestId]];
    [stream writeMessage:7 value:[self session]];
}

- (id)serializedData {
    NSMutableData *data = [NSMutableData dataWithLength:[self serializedSize]];
    PBCodedOutputStream *stream = [CBGetClass(PBCodedOutputStream) streamWithData:data];
    [self writeToCodedOutputStream:stream];
    return data;
}

@end

#pragma GCC diagnostic pop
