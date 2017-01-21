//
//  ZHBookCell.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/17.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHCommon.h"
@class ZHBookModel;

@interface ZHBookCell : UICollectionViewCell

@property (nonatomic, copy)zh_voidBlock deleteBlock;

- (void)setupBook:(ZHBookModel *)book;
- (void)setupIsDelete:(BOOL)isDelete;

@end
