//
//  ZHChapterBodyModel.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHChapterBodyModel.h"
#import "TFHpple.h"
#import "ZHTextView.h"
#import "ZHTextView+Static.h"
#import "ZHCommon.h"

@implementation ZHChapterBodyModel

- (BOOL)isValid {
    return self.content.length > 0;
}

- (BOOL)hasPre {
    return self.preAddress.length > 0;
}
- (BOOL)hasNext {
    return self.nextAddress.length > 0;
}

- (NSArray *)pages{
    NSAttributedString *lAttributedString = [ZHTextView attributedTextByText:self.content];
    NSArray *lArray = [lAttributedString pagesInSize:ZH_PageSize];
    return lArray;
}

+ (ZHChapterBodyModel *)chapterBodyWithElement:(TFHppleElement *)element andAddress:(NSString *)address {
    NSString *lContent = @"";
    for (TFHppleElement *lElement in element.children) {
        if (lElement.content) {
            lContent = [lContent stringByAppendingString:lElement.content];
        }else {
            lContent = [lContent stringByAppendingString:@"\r\n"];
        }
    }
    
    return nil;
}

+ (NSString *)contentWithElement:(TFHppleElement *)element {
    NSString *lContent = @"";
    for (TFHppleElement *lElement in element.children) {
        if (lElement.content) {
            lContent = [lContent stringByAppendingString:lElement.content];
        }else {
            lContent = [lContent stringByAppendingString:@"\r\n"];
        }
    }
    return lContent;
}

+ (ZHChapterBodyModel *)chapterBodyWithHpple:(TFHpple *)hpple andAddress:(NSString *)address {
    NSArray *lTitleElements  = [hpple searchWithXPathQuery:@"//div[@id='chapers_title']/h1"];
    NSString *lTitle = [ZHChapterBodyModel contentWithElement:lTitleElements.firstObject];
    
    NSArray *lContentElements  = [hpple searchWithXPathQuery:@"//div[@id='chapter_content']"];
    NSString *lContent = [ZHChapterBodyModel contentWithElement:lContentElements.firstObject];
    
    NSArray *lPreElements = [hpple searchWithXPathQuery:@"//div[@id='page_bar']//a[@id='prevLink']"];
    TFHppleElement *lPreElement = lPreElements.firstObject;
    NSString *lPreHref = [lPreElement objectForKey:@"href"];
    
    NSArray *lNextElements = [hpple searchWithXPathQuery:@"//div[@id='page_bar']//a[@id='nextLink']"];
    TFHppleElement *lNextElement = lNextElements.firstObject;
    NSString *lNextHref = [lNextElement objectForKey:@"href"];
    
    NSString *lRootAddress = [address stringByDeletingLastPathComponent];
    
    ZHChapterBodyModel *lChapterBody = [[ZHChapterBodyModel alloc] init];
    lChapterBody.title =lTitle;
    lChapterBody.content = lContent;
    lChapterBody.address = address;
    if (lPreHref.length > 0) {
        lChapterBody.preAddress = [lRootAddress stringByAppendingPathComponent:lPreHref];
    }
    if (lNextHref.length > 0) {
        lChapterBody.nextAddress = [lRootAddress stringByAppendingPathComponent:lNextHref];
    }
    return lChapterBody;
}

@end
