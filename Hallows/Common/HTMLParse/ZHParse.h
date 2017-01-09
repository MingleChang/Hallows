//
//  ZHParse.h
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHCommon.h"

@interface ZHParse : NSObject

+ (void)parseChapterListWithAddress:(NSString *)address completion:(zh_completionBlock)completion;
+ (void)parseChapterBodyWithAddress:(NSString *)address completion:(zh_completionBlock)completion;
@end
