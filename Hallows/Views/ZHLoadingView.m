//
//  ZHLoadingView.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/16.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHLoadingView.h"
#import "ZHCommon.h"

@interface ZHLoadingView ()

@end

@implementation ZHLoadingView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure {
    UIActivityIndicatorView *lActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    lActivityIndicatorView.color = [UIColor blackColor];
    lActivityIndicatorView.hidesWhenStopped =YES;
    [self addSubview:lActivityIndicatorView];
    [lActivityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [lActivityIndicatorView startAnimating];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
