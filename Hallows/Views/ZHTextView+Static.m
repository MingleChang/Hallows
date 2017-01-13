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
    return [UIColor redColor];
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
@end
