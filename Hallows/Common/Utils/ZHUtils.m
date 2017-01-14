//
//  ZHUtils.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHUtils.h"
#import <MJRefresh/MJRefresh.h>
@implementation ZHUtils

+ (MJRefreshFooter *)zh_footerWithRefreshingScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action {
    MJRefreshBackNormalFooter *lFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    scrollView.mj_footer = lFooter;
    return lFooter;
}

@end
