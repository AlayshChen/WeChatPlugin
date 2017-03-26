//
//  MMStatus.m
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatus.h"
#import "NSDate+StatusTimeDescription.h"
#import "NSString+XMLDictionary.h"

@implementation MMStatus

- (void)updateWithSnsObject:(MMSnsObject *)snsObject {
    _statusId = snsObject.id;
    WCContactData *contact = [[[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(ContactStorage)] GetContact:snsObject.username];
    _profileImageURLString = contact.m_nsHeadImgUrl;
    _nameString = contact.m_nsRemark.length ? contact.m_nsRemark : contact.m_nsNickName;
    _timeString = [[NSDate dateWithTimeIntervalSince1970:snsObject.createTime] statusTimeDescription];
    
    NSString *timeLineObj = [[NSString alloc] initWithData:snsObject.objectDesc.buffer encoding:NSUTF8StringEncoding];
    timeLineObj = [timeLineObj stringByReplacingOccurrencesOfString:@"&#x0A;" withString:@"\n"];
    
    NSDictionary *timeLineObjDic = [timeLineObj xmlDictionary][@"TimelineObject"];
    NSLog(@"%@", timeLineObjDic);
    
    NSDictionary *contentObjDic = timeLineObjDic[@"ContentObject"];
    
    NSString *content = timeLineObjDic[@"contentDesc"];
    NSMutableAttributedString *contentAttributedString = [NSMutableAttributedString new];
    
    if ([content isKindOfClass:[NSString class]] && content.length) {
        [contentAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName: [NSFont systemFontOfSize:13]}]];
    }
    self.contentAttributedString = contentAttributedString;
    
    NSString *appName = timeLineObjDic[@"appInfo"][@"appName"];
    if ([appName isKindOfClass:[NSString class]] && appName.length) {
        _sourceString = appName;
    }
    
    NSString *contentStyle = contentObjDic[@"contentStyle"];
    contentStyle = [contentStyle stringByReplacingOccurrencesOfString:@"![CDATA[" withString:@""];
    contentStyle = [contentStyle stringByReplacingOccurrencesOfString:@"]" withString:@""];
    NSInteger mediaStyle = [contentStyle integerValue];
    NSArray *mediaList = contentObjDic[@"mediaList"][@"media"];
    if ([mediaList isKindOfClass:[NSDictionary class]]) {
        if (mediaList.count) {
            mediaList = @[mediaList];
        }
        else {
            mediaList = nil;
        }
    }
    
    if (mediaStyle == 1) {
        self.mediaType = MMStatusMediaObjectTypeImage;
        MMStatusImageMediaObject *mediaObject = [MMStatusImageMediaObject new];
        NSMutableArray *imageURLStrings = [NSMutableArray new];
        for (NSDictionary *media in mediaList) {
            [imageURLStrings addObject:media[@"url"]];
        }
        mediaObject.imageURLStrings = imageURLStrings.copy;
        self.mediaObject = mediaObject;
    }
    else if (mediaStyle == 3 || mediaStyle == 4 || mediaStyle == 5) {
        self.mediaType = MMStatusMediaObjectTypeLink;
        NSDictionary *media = mediaList.firstObject;
        NSString *title = contentObjDic[@"title"];
        if (![title isKindOfClass:[NSString class]]) {
            title = media[@"title"];
        }
        MMStatusLinkMediaObject *mediaObject = [MMStatusLinkMediaObject new];
        mediaObject.linkURLString = contentObjDic[@"contentUrl"];
        mediaObject.title = title;
        mediaObject.imageURLString = media[@"thumb"];
        self.mediaObject = mediaObject;
    }
    self.isLiked = snsObject.likeFlag;
    self.likeCount = snsObject.likeCount;
    self.commentCount = snsObject.commentCount;
}

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
