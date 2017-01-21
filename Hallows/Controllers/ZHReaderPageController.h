//
//  ZHReaderPageController.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHReaderPageController : ZHViewController

@property (nonatomic, copy)NSAttributedString *text;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, assign)NSInteger totalPage;
@property (nonatomic, copy)NSString *pageTitle;

- (void)showTitle:(NSString *)title;
- (void)showAttributedText:(NSAttributedString *)text page:(NSInteger)page totalPage:(NSInteger)totalPage;

@end
