//
//  PBUtility.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#ifndef PBUtility_h
#define PBUtility_h

SInt32 PBWireFormatMakeTag(SInt32 fieldNumber, SInt32 wireType);
SInt32 computeRawVarint32Size(SInt32 value);
SInt32 computeTagSize(SInt32 fieldNumber);
SInt32 computeMessageSize(SInt32 fieldNumber, PBGeneratedMessage *value);
SInt32 computeMessageSizeNoTag(PBGeneratedMessage *value);
SInt32 computeStringSizeNoTag(const NSString* value);
SInt32 computeStringSize(SInt32 fieldNumber, const NSString* value);
SInt32 computeInt32Size(SInt32 fieldNumber, SInt32 value);
SInt32 computeInt32SizeNoTag(SInt32 value);
SInt32 computeRawVarint64Size(SInt64 value);
SInt32 computeInt64SizeNoTag(SInt64 value);
SInt32 computeInt64Size(SInt32 fieldNumber, SInt64 value);

#endif /* PBUtility_h */
