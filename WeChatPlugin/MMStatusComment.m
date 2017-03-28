//
//  MMStatusComment.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusComment.h"
#import "NSDate+StatusTimeDescription.h"

@implementation MMStatusComment

- (BOOL)hasContent {
    return self.contentAttributedString.length;
}

- (void)updateWithCommentInfo:(MMSnsCommentInfo *)commentInfo {
    _commentId = commentInfo.commentId2;
    _username = commentInfo.username;
    WCContactData *contact = [[[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(ContactStorage)] GetContact:commentInfo.username];
    _profileImageURLString = contact.m_nsHeadImgUrl;
    _nameString = contact.m_nsRemark.length ? contact.m_nsRemark : contact.m_nsNickName;
    _timeString = [[NSDate dateWithTimeIntervalSince1970:commentInfo.createTime] statusTimeDescription];
    
    NSString *content = commentInfo.content;
    NSMutableAttributedString *contentAttributedString = [NSMutableAttributedString new];
    
    if ([content isKindOfClass:[NSString class]] && content.length) {
        if (commentInfo.replyUsername) {
            contact = [[[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(ContactStorage)] GetContact:commentInfo.replyUsername];
            content = [NSString stringWithFormat:@"回复%@: %@", contact.m_nsRemark.length ? contact.m_nsRemark : contact.m_nsNickName, content];
        }
        [contentAttributedString appendAttributedString:[[NSAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName: [NSFont systemFontOfSize:13]}]];
    }
    self.contentAttributedString = contentAttributedString;
}

@end
