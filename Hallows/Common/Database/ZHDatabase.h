//
//  ZHDatabase.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "ZHCommon.h"

@interface ZHDatabase : NSObject

+ (ZHDatabase *)database;
- (void)searchKey:(NSString *)key start:(NSInteger)start count:(NSInteger)count completion:(zh_completionBlock)completion;
- (void)updateBook:(NSInteger)bookId lastChapter:(NSString *)lastChapter;
- (void)queryMyBooksCompletion:(zh_completionBlock)completion;

@end
