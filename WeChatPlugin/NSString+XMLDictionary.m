//
//  NSString+XMLDictionary.m
//  WeChatManagerClient
//
//  Created by CorbinChen on 2016/11/11.
//  Copyright © 2016年 CorbinChen. All rights reserved.
//

#import "NSString+XMLDictionary.h"
#import "XMLReader.h"

@implementation NSString (XMLDictionary)

- (NSDictionary *)xmlDictionary {
    return [XMLReader dictionaryForXMLString:self error:nil];
}

@end
