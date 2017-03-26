//
//  PBUtility.c
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#include "PBUtility.h"

typedef enum {
    PBWireFormatVarint = 0,
    PBWireFormatFixed64 = 1,
    PBWireFormatLengthDelimited = 2,
    PBWireFormatStartGroup = 3,
    PBWireFormatEndGroup = 4,
    PBWireFormatFixed32 = 5,
    
    PBWireFormatTagTypeBits = 3,
    PBWireFormatTagTypeMask = 7 /* = (1 << PBWireFormatTagTypeBits) - 1*/,
    
    PBWireFormatMessageSetItem = 1,
    PBWireFormatMessageSetTypeId = 2,
    PBWireFormatMessageSetMessage = 3
} PBWireFormat;

SInt32 computeInt32SizeNoTag(SInt32 value) {
    if (value >= 0) {
        return computeRawVarint32Size(value);
    } else {
        // Must sign-extend.
        return 10;
    }
}

SInt32 computeInt32Size(SInt32 fieldNumber, SInt32 value) {
    return computeTagSize(fieldNumber) + computeInt32SizeNoTag(value);
}

SInt32 computeRawVarint64Size(SInt64 value) {
    if ((value & (0xffffffffffffffffL <<  7)) == 0) return 1;
    if ((value & (0xffffffffffffffffL << 14)) == 0) return 2;
    if ((value & (0xffffffffffffffffL << 21)) == 0) return 3;
    if ((value & (0xffffffffffffffffL << 28)) == 0) return 4;
    if ((value & (0xffffffffffffffffL << 35)) == 0) return 5;
    if ((value & (0xffffffffffffffffL << 42)) == 0) return 6;
    if ((value & (0xffffffffffffffffL << 49)) == 0) return 7;
    if ((value & (0xffffffffffffffffL << 56)) == 0) return 8;
    if ((value & (0xffffffffffffffffL << 63)) == 0) return 9;
    return 10;
}

SInt32 computeInt64SizeNoTag(SInt64 value) {
    return computeRawVarint64Size(value);
}

SInt32 computeInt64Size(SInt32 fieldNumber, SInt64 value) {
    return computeTagSize(fieldNumber) + computeInt64SizeNoTag(value);
}

SInt32 computeStringSize(SInt32 fieldNumber, const NSString* value) {
    return computeTagSize(fieldNumber) + computeStringSizeNoTag(value);
}

SInt32 computeStringSizeNoTag(const NSString* value) {
    const UInt32 length = (UInt32)[value lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    return computeRawVarint32Size(length) + length;
}

SInt32 PBWireFormatMakeTag(SInt32 fieldNumber, SInt32 wireType) {
    return (fieldNumber << PBWireFormatTagTypeBits) | wireType;
}

SInt32 computeRawVarint32Size(SInt32 value) {
    if ((value & (0xffffffff <<  7)) == 0) return 1;
    if ((value & (0xffffffff << 14)) == 0) return 2;
    if ((value & (0xffffffff << 21)) == 0) return 3;
    if ((value & (0xffffffff << 28)) == 0) return 4;
    return 5;
}

SInt32 computeTagSize(SInt32 fieldNumber) {
    return computeRawVarint32Size(PBWireFormatMakeTag(fieldNumber, 0));
}

SInt32 computeMessageSizeNoTag(PBGeneratedMessage *value) {
    SInt32 size = [value serializedSize];
    return computeRawVarint32Size(size) + size;
}

SInt32 computeMessageSize(SInt32 fieldNumber, id value) {
    return computeTagSize(fieldNumber) + computeMessageSizeNoTag(value);
}
