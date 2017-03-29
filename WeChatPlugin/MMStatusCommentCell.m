//
//  MMStatusCommentCell.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusCommentCell.h"
#import "MMStatusComment.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MMStatusCommentCell

- (void)updateViewWithComment:(MMStatusComment *)comment {
    _comment = comment;
    self.profileImageView.image = [WeChatService(MMAvatarService) defaultAvatarImage];
    MMAvatarService *service = [[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(MMAvatarService)];
    [service getAvatarImageWithUrl:comment.profileImageURLString completion:^(NSImage *image) {
        self.profileImageView.image = image;
    }];
    self.nameTextField.stringValue = comment.nameString;
    self.timeTextField.stringValue = comment.timeString;
    self.contentTextField.attributedStringValue = comment.contentAttributedString;
}

#pragma mark - Height

+ (CGFloat)calculateHeightForComment:(MMStatusComment *)comment withWidth:(CGFloat)width {
    CGFloat height = 10 + 19;
    if ([comment hasContent]) {
        height += 8;
        NSRect rect = [comment.contentAttributedString boundingRectWithSize:NSMakeSize(width - 70, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        height += rect.size.height;
    }
    height += 10;
    return height;
}

#pragma mark - Event

- (void)mouseUp:(NSEvent *)event {
    CGPoint point = [self convertPoint:[event locationInWindow] fromView:nil];
    if ([self mouse:point inRect:self.profileImageView.frame]) {
        if ([self.delegate respondsToSelector:@selector(cell:didClickCommentUser:)]) {
            [self.delegate cell:self didClickCommentUser:self.comment.username];
        }
    }
}

- (void)mouseDown:(NSEvent *)event {
    
}

@end
