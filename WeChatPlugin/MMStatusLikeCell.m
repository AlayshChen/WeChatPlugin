//
//  MMStatusLikeCell.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/29.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusLikeCell.h"
#import "MMStatusLikeCellItem.h"

@interface MMStatusLikeCell () <NSCollectionViewDataSource, NSCollectionViewDelegate>

@end

@implementation MMStatusLikeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusLikeCellItem class]) bundle:[NSBundle pluginBundle]] forItemWithIdentifier:NSStringFromClass([MMStatusLikeCellItem class])];
}

#pragma mark - NSCollectionViewDataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.status.likeCount;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    MMStatusLikeCellItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass([MMStatusLikeCellItem class]) forIndexPath:indexPath];
    MMStatusComment *likeObj = self.status.likeList[indexPath.item];
    item.profileImageView.image = [WeChatService(MMAvatarService) defaultAvatarImage];
    MMAvatarService *service = [[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(MMAvatarService)];
    [service getAvatarImageWithUrl:likeObj.profileImageURLString completion:^(NSImage *image) {
        item.profileImageView.image = image;
    }];
    item.nameTextField.stringValue = likeObj.nameString;
    return item;
}

#pragma mark - NSCollectionViewDelegate


#pragma mark - 

- (void)updateViewWithStatus:(MMStatus *)status {
    _status = status;
    [self.collectionView reloadData];
}

+ (CGFloat)calculateHeightWithWidth:(CGFloat)width {
    return 60;
}

@end
