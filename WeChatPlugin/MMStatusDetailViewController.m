//
//  MMStatusDetailViewController.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/28.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMStatusDetailViewController.h"
#import "MMStatusCell.h"
#import "MMStatusImageMediaView.h"
#import "MMStatusLinkMediaView.h"
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
    
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusCommentCell class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusCommentCell class])];
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
}

#pragma mark - Title

- (NSString *)title {
    return @"详情";
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.status.commentCount + 1;
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

- (nullable MMStatusCommentCell *)tableView:(NSTableView *)tableView statusCommentCellForRow:(NSInteger)row {
    MMStatusComment *comment = self.status.commentList[row - 1];
    MMStatusCommentCell *cell = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusCommentCell class]) owner:tableView];
    [cell updateViewWithComment:comment];
    return cell;
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    if (row == 0) {
        return [self tableView:tableView statusCellForRow:row];
    }
    else {
        return [self tableView:tableView statusCommentCellForRow:row];
    }
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    if (row == 0) {
        return [MMStatusCell calculateHeightForStatus:self.status inTableView:tableView];
    }
    else {
        MMStatusComment *comment = self.status.commentList[row - 1];
        return [MMStatusCommentCell calculateHeightForComment:comment inTableView:tableView];
    }
}

#pragma mark - MMStatusCellDelegate

- (void)cell:(MMStatusCell *)cell didClickUser:(NSString *)usrname {
    [[CBGetClass(WeChat) sharedInstance] cb_showHomePageWithUsrname:usrname];
}

- (void)cell:(MMStatusCell *)cell didClickImage:(NSImage *)image {
    
}

- (void)cell:(MMStatusCell *)cell didClickMediaLink:(NSString *)url {
    [[CBGetClass(MMURLHandler) defaultHandler] handleURL:url];
}

@end
