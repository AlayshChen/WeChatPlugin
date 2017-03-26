//
//  MMTimeLineMgr.m
//  WeChatPlugin
//
//  Created by CorbinChen on 2017/3/24.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "MMTimeLineMgr.h"

@interface MMTimeLineMgr () <MMCGIDelegate>

@property (nonatomic, assign, getter=isRequesting) BOOL requesting;
@property (nonatomic, strong) NSString *firstPageMd5;
@property (nonatomic, strong) SKBuiltinBuffer_t *session;
@property (nonatomic, strong) NSMutableArray *statuses;

@end

@implementation MMTimeLineMgr

#pragma mark - Network

- (void)updateTimeLineHead {
    [self requestTimeLineDataAfterItemID:0];
}

- (void)updateTimeLineTail {
    MMStatus *status = [self.statuses lastObject];
    [self requestTimeLineDataAfterItemID:status.statusId];
}

- (void)requestTimeLineDataAfterItemID:(unsigned long long)itemID {
    if (self.isRequesting) {
        return;
    }
    self.requesting = true;
    MMSnsTimeLineRequest *request = [[CBGetClass(MMSnsTimeLineRequest) alloc] init];
    request.baseRequest = [CBGetClass(MMCGIRequestUtil) InitBaseRequestWithScene:0];
    request.clientLatestId = 0;
    request.firstPageMd5 = itemID == 0 ? self.firstPageMd5 : @"";
    request.lastRequestTime = 0;
    request.maxId = itemID;
    request.minFilterId = 0;
    request.session = self.session;
    MMCGIWrap *cgiWrap = [[CBGetClass(MMCGIWrap) alloc] init];
    cgiWrap.m_requestPb = (PBGeneratedMessage *)request;
    cgiWrap.m_functionId = kMMCGIWrapTimeLineFunctionId;
    
    MMCGIService *cgiService = [[CBGetClass(MMServiceCenter) defaultCenter] getService:CBGetClass(MMCGIService)];
    [cgiService RequestCGI:cgiWrap delegate:self];
}

#pragma mark - MMCGIDelegate

- (void)OnResponseCGI:(BOOL)arg1 sessionId:(unsigned int)arg2 cgiWrap:(MMCGIWrap *)cgiWrap {
    NSLog(@"%d %d %@", arg1, arg2, cgiWrap);
    MMSnsTimeLineRequest *request = (MMSnsTimeLineRequest *)cgiWrap.m_requestPb;
    MMSnsTimeLineResponse *response = (MMSnsTimeLineResponse *)cgiWrap.m_responsePb;
    self.session = response.session;
    NSMutableArray *statuses = [NSMutableArray new];
    for (MMSnsObject *snsObject in response.objectList) {
        MMStatus *status = [MMStatus new];
        [status updateWithSnsObject:snsObject];
        [statuses addObject:status];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
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
        if (self.delegate && [self.delegate respondsToSelector:@selector(onTimeLineStatusChange)]) {
            [self.delegate onTimeLineStatusChange];
        }
    });
}

#pragma mark - 

- (NSUInteger)getTimeLineStatusCount {
    return [self.statuses count];
}

- (MMStatus *)getTimeLineStatusAtIndex:(NSUInteger)index {
    if (index >= self.statuses.count) {
        return nil;
    }
    else {
        return self.statuses[index];
    }
}

@end
