//
//  MMStatusLikeCell.h
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MMStatusLikeCell : NSTableCellView

@property (weak) IBOutlet NSCollectionView *collectionView;
@property (nonatomic, strong, readonly) MMStatus *status;

- (void)updateViewWithStatus:(MMStatus *)status;
+ (CGFloat)calculateHeightWithWidth:(CGFloat)width;

@end
