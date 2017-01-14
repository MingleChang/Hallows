//
//  NSAttributedString+Hallows.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "NSAttributedString+Hallows.h"

@implementation NSAttributedString (Hallows)

- (NSArray *)pagesInSize:(CGSize)size {
    CGSize maxSize = CGSizeMake(size.width, CGFLOAT_MAX);
    NSMutableArray *lArray = [NSMutableArray array];
    NSInteger startIndex = 0;
    
    for (NSInteger i = 0; i < self.length; i++) {
        NSRange lRange = NSMakeRange(startIndex, i - startIndex + 1);
        NSAttributedString *lAttrString = [self attributedSubstringFromRange:lRange];
        CGSize lSize = [lAttrString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil ].size;
        if (lSize.height > size.height) {
            NSRange lSubRange = NSMakeRange(startIndex, i - startIndex);
            NSAttributedString *lSubString = [self attributedSubstringFromRange:lSubRange];
            startIndex = i;
            [lArray addObject:lSubString];
        }
    }
    
    if (startIndex < self.length) {
        NSRange lSubRange = NSMakeRange(startIndex, self.length - startIndex);
        NSAttributedString *lSubString = [self attributedSubstringFromRange:lSubRange];
        [lArray addObject:lSubString];
    }
    
    return [lArray copy];
}

@end
