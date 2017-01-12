//
//  ZHDatabase.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHDatabase.h"
#import "ZHCommon.h"
#import "ZHModel.h"

@interface ZHDatabase ()

@property (nonatomic, strong)FMDatabaseQueue *database;

@end

@implementation ZHDatabase

+ (ZHDatabase *)database {
    static ZHDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = [[ZHDatabase alloc] init];
    });
    return database;
}

- (void)searchKey:(NSString *)key start:(NSInteger)start count:(NSInteger)count completion:(zh_completionBlock)completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.database inDatabase:^(FMDatabase *db) {
            NSString *lSql = [NSString stringWithFormat:@"SELECT * FROM hallows WHERE title LIKE '%%%@%%' ORDER BY id LIMIT %li,%li",key,start,count];
            FMResultSet *resultSet = [db executeQuery:lSql];
            NSArray *lArray = [ZHBookModel bookModelsWithResultSet:resultSet];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(lArray,nil);
                }
            });
        }];
    });
}

#pragma mark - Setter And Getter 
- (FMDatabaseQueue *)database {
    if (_database) {
        return _database;
    }
    NSString *lPath = [[NSBundle mainBundle]pathForResource:@"hallows" ofType:@"db"];
    _database = [FMDatabaseQueue databaseQueueWithPath:lPath];
    return _database;
}

@end
