//
//  ZHBookModel.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;

@interface ZHBookModel : NSObject

@property (nonatomic, assign)NSInteger id;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *author;
@property (nonatomic, copy)NSString *cover;
@property (nonatomic, copy)NSString *link;
@property (nonatomic, copy)NSString *chapter;
@property (nonatomic, copy)NSString *lastChapter;

+ (NSArray *)bookModelsWithResultSet:(FMResultSet *)resultSet;

@end
