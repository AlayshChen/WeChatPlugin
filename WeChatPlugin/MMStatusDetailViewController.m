//
//  MMStatusDetailViewController.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusDetailViewController.h"
#import "NSViewController+ImagePreview.h"
#import "MMStatusCell.h"
#import "MMStatusImageMediaView.h"
#import "MMStatusLinkMediaView.h"
#import "MMStatusLikeCell.h"
#import "MMStatusCommentCell.h"

@interface MMStatusDetailViewController () <NSTableViewDataSource, NSTableViewDelegate, MMStatusCellDelegate>

@end

@implementation MMStatusDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = true;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusCell class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusCell class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusImageMediaView class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusImageMediaView class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusLinkMediaView class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusLinkMediaView class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusLikeCell class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusLikeCell class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusCommentCell class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusCommentCell class])];
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
}

#pragma mark - Title

- (NSString *)title {
    return @"详情";
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsWithoutComment {
    NSInteger res = 1;
    if (self.status.likeCount) {
        res += 1;
    }
    return res;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self numberOfRowsWithoutComment] + self.status.commentCount;
}

#pragma mark - NSTableViewDelegate

- (nullable MMStatusMediaView *)tableView:(NSTableView *)tableView mediaViewForCell:(MMStatusCell *)cell status:(MMStatus *)status {
    MMStatusMediaView *mediaView;
    switch (status.mediaType) {
        case MMStatusMediaObjectTypeImage: {
            mediaView = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusImageMediaView class]) owner:tableView];
        }
            break;
        case MMStatusMediaObjectTypeLink: {
            mediaView = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusLinkMediaView class]) owner:tableView];
        }
            break;
        default:
            break;
    }
    return mediaView;
}

- (nullable MMStatusCell *)tableView:(NSTableView *)tableView statusCellForRow:(NSInteger)row {
    MMStatus *status = self.status;
    MMStatusCell *cell = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusCell class]) owner:tableView];
    MMStatusMediaView *mediaView = [self tableView:tableView mediaViewForCell:cell status:status];
    [cell updateViewWithStatus:status mediaView:mediaView];
    cell.delegate = self;
    return cell;
}

- (nullable MMStatusLikeCell *)tableView:(NSTableView *)tableView statusLikeCellForRow:(NSInteger)row {
    MMStatus *status = self.status;
    MMStatusLikeCell *cell = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusLikeCell class]) owner:tableView];
    [cell updateViewWithStatus:status];
    return cell;
}

- (nullable MMStatusCommentCell *)tableView:(NSTableView *)tableView statusCommentCellForRow:(NSInteger)row {
    MMStatusComment *comment = [self commentForRow:row];
    MMStatusCommentCell *cell = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusCommentCell class]) owner:tableView];
    [cell updateViewWithComment:comment];
    return cell;
}

- (NSInteger)commentRowFromRow:(NSInteger)row {
    return row - [self numberOfRowsWithoutComment];
}

- (MMStatusComment *)commentForRow:(NSInteger)row {
    row = [self commentRowFromRow:row];
    if (row >= 0 && row < self.status.commentCount) {
        return self.status.commentList[row];
    }
    else {
        return nil;
    }
}

- (BOOL)isStatusCellForRow:(NSInteger)row {
    return row == 0;
}

- (BOOL)isStatusLikeCellForRow:(NSInteger)row {
    return row == [self numberOfRowsWithoutComment] - 1 && self.status.likeCount;
}

- (BOOL)isStatusCommentCellForRow:(NSInteger)row {
    return row >= [self numberOfRowsWithoutComment];
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    if ([self isStatusCellForRow:row]) {
        return [self tableView:tableView statusCellForRow:row];
    }
    else if ([self isStatusLikeCellForRow:row]) {
        return [self tableView:tableView statusLikeCellForRow:row];
    }
    else if ([self isStatusCommentCellForRow:row]) {
        return [self tableView:tableView statusCommentCellForRow:row];
    }
    else {
        return nil;
    }
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    if ([self isStatusCellForRow:row]) {
        return [MMStatusCell calculateHeightForStatus:self.status withWidth:self.view.frame.size.width];
    }
    else if ([self isStatusLikeCellForRow:row]) {
        return [MMStatusLikeCell calculateHeightWithWidth:self.view.frame.size.width];
    }
    else if ([self isStatusCommentCellForRow:row]) {
        MMStatusComment *comment = [self commentForRow:row];
        return [MMStatusCommentCell calculateHeightForComment:comment withWidth:self.view.frame.size.width];
    }
    else {
        return 0;
    }
}

#pragma mark - MMStatusCellDelegate

- (void)cell:(MMStatusCell *)cell didClick:(MMStatus *)status {
    [[CBGetClass(WeChat) sharedInstance] cb_showStatusDetailWithStatus:status];
}

- (void)cell:(MMStatusCell *)cell didClickUser:(NSString *)usrname {
    [[CBGetClass(WeChat) sharedInstance] cb_showHomePageWithUsrname:usrname];
}

- (void)cell:(MMStatusCell *)cell didClickImage:(NSImage *)image imageFilePath:(NSString *)filePath {
    [self previewImage:image atFilePath:filePath];
}

- (void)cell:(MMStatusCell *)cell didClickMediaLink:(NSString *)url {
    [[CBGetClass(MMURLHandler) defaultHandler] handleURL:url];
}

@end
