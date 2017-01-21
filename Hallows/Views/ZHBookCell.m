//
//  ZHBookCell.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/17.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHBookCell.h"
#import "ZHCommon.h"
#import "ZHModel.h"

@interface ZHBookCell ()
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *cellDeleteButton;

- (IBAction)cellDeleteButtonClick:(UIButton *)sender;

@end

@implementation ZHBookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupBook:(ZHBookModel *)book {
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:book.cover] placeholderImage:PlaceholderImage];
    self.cellTitleLabel.text = book.title;
}

- (void)setupIsDelete:(BOOL)isDelete {
    self.cellDeleteButton.hidden = !isDelete;
}

- (IBAction)cellDeleteButtonClick:(UIButton *)sender {
    if (self.deleteBlock) {
        self.deleteBlock();
    }
}
@end
