//
//  MMStatus.m
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatus.h"

@implementation MMStatus

- (BOOL)hasSource {
    return self.sourceString.length;
}

- (BOOL)hasContent {
    return self.contentAttributedString.length;
}

- (BOOL)hasMediaObject {
    return self.mediaType != MMStatusMediaObjectTypeNone;
}

@end
