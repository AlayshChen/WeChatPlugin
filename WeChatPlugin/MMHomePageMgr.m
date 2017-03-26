//
//  MMHomePageMgr.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/26.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMHomePageMgr.h"

@interface MMHomePageMgr () <MMCGIDelegate>

@property (nonatomic, assign, getter=isRequesting) BOOL requesting;
@property (nonatomic, strong) NSString *firstPageMd5;
@property (nonatomic, strong) NSMutableArray *statuses;

@end

@implementation MMHomePageMgr

#pragma mark - Network

- (void)updateHomePageHead {
    [self requestHomePageDataAfterItemID:0];
}

- (void)updateHomePageTail {
    MMStatus *status = [self.statuses lastObject];
    [self requestHomePageDataAfterItemID:status.statusId];
}

- (void)requestHomePageDataAfterItemID:(unsigned long long)itemID {
    if (self.isRequesting) {
        return;
    }
    self.requesting = true;
    MMSnsUserPageRequest *request = [[CBGetClass(MMSnsUserPageRequest) alloc] init];
    request.baseRequest = [CBGetClass(MMCGIRequestUtil) InitBaseRequestWithScene:0];
    request.firstPageMd5 = itemID == 0 ? self.firstPageMd5 : @"";
    request.lastRequestTime = 0;
    request.maxId = itemID;
    request.minFilterId = 0;
    request.username = self.usrname;
    
    MMCGIWrap *cgiWrap = [[CBGetClass(MMCGIWrap) alloc] init];
    cgiWrap.m_requestPb = (PBGeneratedMessage *)request;
    cgiWrap.m_functionId = kMMCGIWrapHomePageFunctionId;
    
    MMCGIService *cgiService = [[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(MMCGIService)];
    [cgiService RequestCGI:cgiWrap delegate:self];
}

#pragma mark - MMCGIDelegate

- (void)OnResponseCGI:(BOOL)arg1 sessionId:(unsigned int)arg2 cgiWrap:(MMCGIWrap *)cgiWrap {
    NSLog(@"%d %d %@", arg1, arg2, cgiWrap);
    MMSnsUserPageRequest *request = (MMSnsUserPageRequest *)cgiWrap.m_requestPb;
    MMSnsUserPageResponse *response = (MMSnsUserPageResponse *)cgiWrap.m_responsePb;
    
    NSMutableArray *statuses = [NSMutableArray new];
    for (MMSnsObject *snsObject in response.objectList) {
        MMStatus *status = [MMStatus new];
        [status updateWithSnsObject:snsObject];
        [statuses addObject:status];
    }
    
    BOOL isRefresh = request.maxId == 0;
    if (isRefresh) {
        self.firstPageMd5 = response.firstPageMd5;
        if (statuses.count) {
            self.statuses = statuses;
        }
    }
    else {
        [self.statuses addObjectsFromArray:statuses];
    }
    self.requesting = false;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onHomePageStatusChange)]) {
        [self.delegate onHomePageStatusChange];
    }
}

#pragma mark -

- (NSUInteger)getHomePageStatusCount {
    return [self.statuses count];
}

- (MMStatus *)getHomePageStatusAtIndex:(NSUInteger)index {
    if (index >= self.statuses.count) {
        return nil;
    }
    else {
        return self.statuses[index];
    }
}

@end
