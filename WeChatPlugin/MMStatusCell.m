//
//  MMStatusCell.m
//  WeChatTimeLine
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusCell.h"
#import "MMStatusMediaView.h"
#import "MMStatusImageMediaView.h"
#import "MMStatusLinkMediaView.h"
#import "MMStatus.h"
#import "MMStatusMediaObject.h"
#import "MMStatusImageMediaObject.h"
#import "MMStatusLinkMediaObject.h"

@implementation MMStatusCell

- (void)updateViewWithStatus:(MMStatus *)status {
    _status = status;
    self.nameTextField.stringValue = status.nameString;
    self.tagTextField.stringValue = [NSString stringWithFormat:@"%@%@", status.timeString, [status hasSource] ? [NSString stringWithFormat:@" - %@", status.sourceString] : @""];
    if ([status hasContent]) {
        self.toContentTextFieldLayoutConstraint.active = true;
        self.toTagTextFieldLayoutConstraint.active = false;
        self.contentTextField.hidden = false;
        self.contentTextField.attributedStringValue = status.contentAttributedString;
    }
    else {
        self.toContentTextFieldLayoutConstraint.active = false;
        self.toTagTextFieldLayoutConstraint.active = true;
        self.contentTextField.hidden = true;
    }
    if ([status hasMediaObject]) {
        switch (status.mediaType) {
            case MMStatusMediaObjectTypeImage: {
                MMStatusImageMediaObject *mediaObject = (MMStatusImageMediaObject *)status.mediaObject;
                MMStatusImageMediaView *mediaView = (MMStatusImageMediaView *)self.mediaRealView;
                for (NSImageView *imageView in mediaView.imageViews) {
                    imageView.hidden = true;
                }
                for (NSInteger i = 0; i < mediaObject.imageURLStrings.count; i ++) {
                    NSImageView *imageView = mediaView.imageViews[i];
                    imageView.hidden = false;
                }
            }
                break;
            case MMStatusMediaObjectTypeLink: {
                MMStatusLinkMediaObject *mediaObject = (MMStatusLinkMediaObject *)status.mediaObject;
                MMStatusLinkMediaView *mediaView = (MMStatusLinkMediaView *)self.mediaRealView;
                mediaView.titleTextField.stringValue = mediaObject.title;
            }
                break;
            default:
                break;
        }
    }
}

+ (CGFloat)calculateHeightForStatus:(MMStatus *)status inTableView:(NSTableView *)tableView {
    CGFloat height = 55;
    if ([status hasContent]) {
        height += 5;
        NSRect rect = [status.contentAttributedString boundingRectWithSize:NSMakeSize(tableView.frame.size.width - 80, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
        height += rect.size.height; 
    }
    if ([status hasMediaObject]) {
        height += 5;
        switch (status.mediaType) {
            case MMStatusMediaObjectTypeImage: {
                CGFloat imageSize = (tableView.frame.size.width - 80) / 3.0;
                MMStatusImageMediaObject *mediaObject = (MMStatusImageMediaObject *)status.mediaObject;
                NSInteger rowCount = mediaObject.imageURLStrings.count / 3 + 1;
                height += (NSInteger)(rowCount * imageSize);
            }
                break;
            case MMStatusMediaObjectTypeLink:
                height += 40;
            default:
                break;
        }
    }
    height += 10;
    return height;
}

@end
