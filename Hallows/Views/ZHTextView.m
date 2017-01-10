//
//  ZHTextView.m
//  Hallows
//
//  Created by Mingle on 2017/1/10.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHTextView.h"
#import "ZHTextView+Static.h"

@implementation ZHTextView

#pragma mark - Static Methods



#pragma mark - Member Methods
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (NSAttributedString *)attributedTextByText:(NSString *)text {
    NSMutableAttributedString *lAttributedStr = [[NSMutableAttributedString alloc] initWithString:text];
    UIFont *lFont = [UIFont systemFontOfSize:[ZHTextView fontSize]];
    [lAttributedStr addAttribute:NSFontAttributeName value:lFont range:NSMakeRange(0, lAttributedStr.length)];
    
    [lAttributedStr addAttribute:NSForegroundColorAttributeName value:[ZHTextView fontColor] range:NSMakeRange(0, lAttributedStr.length)];
    
    NSMutableParagraphStyle *lParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    lParagraphStyle.lineSpacing = [ZHTextView lineSpacing];
    [lAttributedStr addAttribute:NSParagraphStyleAttributeName value:lParagraphStyle range:NSMakeRange(0, lAttributedStr.length)];
    return [lAttributedStr copy];
}

- (void)setText:(NSString *)text {
    NSAttributedString *lAttributedString = [self attributedTextByText:text];
    self.attributedText = lAttributedString;
}
@end
