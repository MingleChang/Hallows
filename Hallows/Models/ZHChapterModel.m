//
//  ZHChapterModel.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHChapterModel.h"
#import "TFHpple.h"

@implementation ZHChapterModel

- (NSString *)description {
    return [NSString stringWithFormat:@"NAME:%@ \n ADDRESS:%@", self.name, self.address];
}

+ (ZHChapterModel *)chapterWithElement:(TFHppleElement *)element andAddress:(NSString *)address {
    NSString *name = element.text;
    NSString *href = [element objectForKey:@"href"];
    NSString *url = [address stringByAppendingPathComponent:href];
    ZHChapterModel *lModel = [[ZHChapterModel alloc] init];
    lModel.name = name;
    lModel.address = url;
    return lModel;
}

+ (NSArray *)chaptersWithElements:(NSArray *)array andAddress:(NSString *)address {
    NSMutableArray *lChapters = [NSMutableArray array];
    for (TFHppleElement *lElement in array) {
        ZHChapterModel *lChapter = [ZHChapterModel chapterWithElement:lElement andAddress:address];
        [lChapters addObject:lChapter];
    }
    return [lChapters copy];
}

@end
