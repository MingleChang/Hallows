//
//  ZHUtils.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJRefreshFooter;

@interface ZHUtils : NSObject

+ (MJRefreshFooter *)zh_footerWithRefreshingScrollView:(UIScrollView *)scrollView refreshingTarget:(id)target refreshingAction:(SEL)action;

@end
