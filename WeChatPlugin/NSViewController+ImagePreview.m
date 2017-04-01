//
//  NSViewController+ImagePreview.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "NSViewController+ImagePreview.h"

static int kPreviewPanelKey;
static int kPreviewItemKey;

@implementation NSViewController (ImagePreview)

#pragma mark - 

- (void)previewImage:(NSImage *)image atFilePath:(NSString *)filePath {
    if (image == nil || filePath.length == 0) {
        return;
    }
    self.previewItem = [[CBGetClass(MMQLPhotoPreviewItem) alloc] init];
    self.previewItem.itemTitle = @"";
    self.previewItem.itemUrlString = filePath;
    self.previewItem.itemUrl = [NSURL fileURLWithPath:filePath];
    self.previewItem.originalImageSize = image.size;
    
    [self.previewPanel close];
    self.previewPanel = nil;
    self.previewPanel = [[CBGetClass(MMPreviewPanel) alloc] init];
    self.previewPanel.dataSource = self;
    self.previewPanel.delegate = self;
    self.previewPanel.allowMultipleItems = false;
    [self.previewPanel show];
}

#pragma mark - Property

- (void)setPreviewPanel:(MMPreviewPanel *)previewPanel {
    objc_setAssociatedObject(self, &kPreviewPanelKey, previewPanel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MMPreviewPanel *)previewPanel {
    return objc_getAssociatedObject(self, &kPreviewPanelKey);
}

- (void)setPreviewItem:(MMQLPhotoPreviewItem *)previewItem {
    objc_setAssociatedObject(self, &kPreviewItemKey, previewItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MMQLPhotoPreviewItem *)previewItem {
    return objc_getAssociatedObject(self, &kPreviewItemKey);
}

#pragma mark - MMPreviewPanelDataSource

- (id)previewPanel:(MMPreviewPanel *)arg1 shareContentAtIndex:(long long)arg2 {
    return self.previewItem;
}

- (id <QLPreviewItem>)previewPanel:(MMPreviewPanel *)arg1 previewItemAtIndex:(long long)arg2 {
    return self.previewItem;
}

- (long long)numberOfPreviewItemsInPreviewPanel:(MMPreviewPanel *)arg1 {
    return 1;
}

#pragma mark - MMPreviewPanelDelegate

- (void)previewPanelDidClose:(MMPreviewPanel *)arg1 {
    
}

- (NSRect)previewPanel:(MMPreviewPanel *)arg1 sourceFrameOnScreenForPreviewItem:(id <QLPreviewItem>)arg2 {
    return NSZeroRect;
}

@end
