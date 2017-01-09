//
//  ZHChapterModel.h
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TFHppleElement;

@interface ZHChapterModel : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *address;

+ (ZHChapterModel *)chapterWithElement:(TFHppleElement *)element andAddress:(NSString *)address;

+ (NSArray *)chaptersWithElements:(NSArray *)elements andAddress:(NSString *)address;

@end
