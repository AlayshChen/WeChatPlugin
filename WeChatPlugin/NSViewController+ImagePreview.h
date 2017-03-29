//
//  NSViewController+ImagePreview.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSViewController (ImagePreview) <MMPreviewPanelDataSource, MMPreviewPanelDelegate>

@property (nonatomic, strong) MMPreviewPanel *previewPanel;
@property (nonatomic, strong) MMQLPhotoPreviewItem *previewItem;

- (void)previewImage:(NSImage *)image atFilePath:(NSString *)filePath;

@end
