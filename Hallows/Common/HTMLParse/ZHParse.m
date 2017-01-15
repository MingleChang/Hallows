//
//  ZHParse.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHParse.h"
#import "TFHpple.h"
#import "ZHModel.h"

@implementation ZHParse

+ (void)parseChapterListWithAddress:(NSString *)address completion:(zh_completionBlock)completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *lData = [NSData dataWithContentsOfURL:[NSURL URLWithString:address]];
        TFHpple *lHpple  = [TFHpple hppleWithHTMLData:lData];
        NSArray *lElements  = [lHpple searchWithXPathQuery:@"//dl[@class='chapterlist']//dd//a"];
        NSArray *lChapters = [ZHChapterModel chaptersWithElements:lElements andAddress:address];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(lChapters, nil);
            }
        });
    });
    
}

+ (void)parseChapterBodyWithAddress:(NSString *)address completion:(zh_completionBlock)completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ZHCache *lCache = [[ZHCacheManager manager] cacheWithKey:address];
        if (lCache) {
            ZHChapterBodyModel *lCacheChapterBody = [ZHChapterBodyModel mj_objectWithKeyValues:lCache.value];
            if (lCacheChapterBody.content.length > 0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (completion) {
                        completion(lCacheChapterBody, nil);
                    }
                });
                return;
            }
        }
        
        NSData *lData = [NSData dataWithContentsOfURL:[NSURL URLWithString:address]];
        TFHpple *lHpple  = [TFHpple hppleWithHTMLData:lData];
        ZHChapterBodyModel *lChapterBody = [ZHChapterBodyModel chapterBodyWithHpple:lHpple andAddress:address];
        NSString *lString = [lChapterBody mj_JSONString];
        [[ZHCacheManager manager] cacheValue:lString forKey:address expire:0];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(lChapterBody, nil);
            }
        });
    });
}

@end
