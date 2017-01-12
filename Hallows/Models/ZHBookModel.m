//
//  ZHBookModel.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHBookModel.h"
#import <FMDB/FMDB.h>
#import <MJExtension/MJExtension.h>

@implementation ZHBookModel

+ (NSArray *)bookModelsWithResultSet:(FMResultSet *)resultSet{
    NSMutableArray *lArray = [NSMutableArray array];
    while ([resultSet next]) {
        NSDictionary *lDic = [resultSet resultDictionary];
        ZHBookModel *lModel = [ZHBookModel mj_objectWithKeyValues:lDic];
        [lArray addObject:lModel];
    }
    return [lArray copy];;
}
@end
