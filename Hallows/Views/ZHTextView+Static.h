//
//  ZHTextView+Static.h
//  Hallows
//
//  Created by Mingle on 2017/1/10.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHTextView.h"

@interface ZHTextView (Static)

+ (UIColor *)fontColor;
+ (void)setFontColor:(UIColor *)color;

+ (CGFloat)fontSize;
+ (void)setFontSize:(CGFloat)size;

+ (CGFloat)lineSpacing;
+ (void)setLineSpacing:(CGFloat)spacing;

+ (NSAttributedString *)attributedTextByText:(NSString *)text;
@end
