//
//  MMHomePageViewController.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMHomePageViewController.h"
#import "MMHomePageMgr.h"
#import "MMStatusCell.h"
#import "MMStatusImageMediaView.h"
#import "MMStatusLinkMediaView.h"

@interface MMHomePageViewController () <NSTableViewDataSource, NSTableViewDelegate, MMStatusCellDelegate, MMHomePageMgrDelegate>

@property (nonatomic, strong) MMHomePageMgr *homePageMgr;

@end

@implementation MMHomePageViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    _homePageMgr = [MMHomePageMgr new];
    _homePageMgr.usrname = self.contact.m_nsUsrName;
    _homePageMgr.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = true;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusCell class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusCell class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusImageMediaView class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusImageMediaView class])];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:NSStringFromClass([MMStatusLinkMediaView class]) bundle:[NSBundle pluginBundle]] forIdentifier:NSStringFromClass([MMStatusLinkMediaView class])];
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleNone;
    NSScrollView *scrollView = [self.tableView enclosingScrollView];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(scrollViewDidScroll:) name:NSViewBoundsDidChangeNotification object:scrollView.contentView];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self.homePageMgr updateHomePageHead];
}

#pragma mark - Title

- (NSString *)title {
    return self.contact.m_nsRemark.length ? self.contact.m_nsRemark : self.contact.m_nsNickName;
}

#pragma mark -

- (void)scrollViewDidScroll:(NSNotification *)notification {
    NSScrollView *scrollView = notification.object;
    CGFloat currentPosition = CGRectGetMaxY([scrollView visibleRect]);
    CGFloat contentHeight = [self.tableView bounds].size.height - 5;
    
    if (currentPosition > contentHeight - 2.0) {
        [self onTableViewScrollToBottom];
    }
}

#pragma mark -

- (void)onTableViewScrollToBottom {
    [self.homePageMgr updateHomePageTail];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.homePageMgr getHomePageStatusCount];
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

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    MMStatus *status = [self.homePageMgr getHomePageStatusAtIndex:row];
    MMStatusCell *cell = [tableView makeViewWithIdentifier:NSStringFromClass([MMStatusCell class]) owner:tableView];
    MMStatusMediaView *mediaView = [self tableView:tableView mediaViewForCell:cell status:status];
    [cell updateViewWithStatus:status mediaView:mediaView];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    MMStatus *status = [self.homePageMgr getHomePageStatusAtIndex:row];
    return [MMStatusCell calculateHeightForStatus:status inTableView:tableView];
}

#pragma mark - MMStatusCellDelegate

- (void)cell:(MMStatusCell *)cell didClick:(MMStatus *)status {
    [[CBGetClass(WeChat) sharedInstance] cb_showStatusDetailWithStatus:status];
}

- (void)cell:(MMStatusCell *)cell didClickImage:(NSImage *)image {
    
}

- (void)cell:(MMStatusCell *)cell didClickMediaLink:(NSString *)url {
    [[CBGetClass(MMURLHandler) defaultHandler] handleURL:url];
}

#pragma mark - MMHomePageMgrDelegate

- (void)onHomePageStatusChange {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
