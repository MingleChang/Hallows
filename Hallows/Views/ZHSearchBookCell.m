//
//  ZHSearchBookCell.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHSearchBookCell.h"
#import "ZHCommon.h"
#import "ZHModel.h"

@interface ZHSearchBookCell ()

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellDetailLabel;

@end

@implementation ZHSearchBookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupBookModel:(ZHBookModel *)book {
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:book.cover] placeholderImage:PlaceholderImage];
    self.cellTitleLabel.text = book.title;
    self.cellDetailLabel.text = book.author;
}

@end
