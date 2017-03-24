//
//  NSDate+StatusTimeDescription.m
//  MacWeChatTimeLinePlugin
//
//  Created by CorbinChen on 2017/3/17.
//  Copyright © 2017年 CorbinChen. All rights reserved.
//

#import "NSDate+StatusTimeDescription.h"

@implementation NSDate (StatusTimeDescription)

- (NSString *)statusTimeDescription {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSString *res = [[NSString stringWithFormat:@"%@", [self dateByAddingTimeInterval:8 * 60 * 60]] substringToIndex:19];
    if ([calendar isDateInToday:self]) {
        return [res substringFromIndex:11];
    }
    else {
        NSString *year = [res substringToIndex:4];
        if ([[NSString stringWithFormat:@"%@", [NSDate dateWithTimeIntervalSinceNow:8 * 60 * 60]] hasPrefix:year]) {
            return [res substringFromIndex:5];
        }
        else {
            return res;
        }
    }
}

@end
