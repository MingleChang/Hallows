//
//  ZHChapterBodyModel.h
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TFHpple;

@interface ZHChapterBodyModel : NSObject

@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *preAddress;
@property (nonatomic, copy)NSString *nextAddress;

- (BOOL)hasPre;
- (BOOL)hasNext;

+ (ZHChapterBodyModel *)chapterBodyWithHpple:(TFHpple *)hpple andAddress:(NSString *)address;

@end
