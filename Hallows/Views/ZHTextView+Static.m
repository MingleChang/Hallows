//
//  ZHTextView+Static.m
//  Hallows
//
//  Created by Mingle on 2017/1/10.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHTextView+Static.h"

static CGFloat fontSize = 20;
static CGFloat lineSpacing = 10;
static UIColor *fontColor;
//static NSString *fontName;

@implementation ZHTextView (Static)
+ (UIColor *)fontColor {
    if (fontColor) {
        return fontColor;
    }
    return [UIColor blackColor];
}

+ (void)setFontColor:(UIColor *)color {
    fontColor = color;
}

+ (CGFloat)fontSize {
    return fontSize;
}

+ (void)setFontSize:(CGFloat)size {
    fontSize = size;
}


+ (CGFloat)lineSpacing {
    return lineSpacing;
}

+ (void)setLineSpacing:(CGFloat)spacing {
    lineSpacing = spacing;
}

+ (NSAttributedString *)attributedTextByText:(NSString *)text {
    NSMutableAttributedString *lAttributedStr = [[NSMutableAttributedString alloc] initWithString:text];
    UIFont *lFont = [UIFont systemFontOfSize:[ZHTextView fontSize]];
    [lAttributedStr addAttribute:NSFontAttributeName value:lFont range:NSMakeRange(0, lAttributedStr.length)];
    
    [lAttributedStr addAttribute:NSForegroundColorAttributeName value:[ZHTextView fontColor] range:NSMakeRange(0, lAttributedStr.length)];
    
    NSMutableParagraphStyle *lParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    lParagraphStyle.lineSpacing = [ZHTextView lineSpacing];
    [lAttributedStr addAttribute:NSParagraphStyleAttributeName value:lParagraphStyle range:NSMakeRange(0, lAttributedStr.length)];
    return [lAttributedStr copy];
}
@end
