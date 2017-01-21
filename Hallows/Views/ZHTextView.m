//
//  ZHTextView.m
//  Hallows
//
//  Created by Mingle on 2017/1/10.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHTextView.h"
#import "ZHTextView+Static.h"
#import "ZHCommon.h"

@interface ZHTextView () <UIGestureRecognizerDelegate>

@end

@implementation ZHTextView

#pragma mark - Static Methods



#pragma mark - Member Methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

#pragma mark - Configure 
- (void)configure {
    self.editable = NO;
    self.bounces = NO;
    self.userInteractionEnabled = NO;
}

- (void)setText:(NSString *)text {
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.textContainerInset));
    NSAttributedString *lAttributedString = [ZHTextView attributedTextByText:text];
    self.attributedText = lAttributedString;
}

@end
