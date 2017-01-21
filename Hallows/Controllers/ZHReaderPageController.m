//
//  ZHReaderPageController.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/14.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHReaderPageController.h"
#import "ZHCommon.h"
#import "ZHTextView.h"

@interface ZHReaderPageController ()

@property (nonatomic, strong)ZHTextView *textView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *pageLabel;
@end

@implementation ZHReaderPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configure];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configure
- (void)configure {
    [self configureView];
    [self configureData];
}

- (void)configureView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.textView = [[ZHTextView alloc] init];
    self.textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.leading.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view);
    }];
    
    self.pageLabel = [[UILabel alloc] init];
    self.pageLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.pageLabel];
    [self.pageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom);
        make.trailing.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view);
    }];
}

- (void)configureData {
    self.textView.attributedText = self.text;
    self.pageLabel.text = [NSString stringWithFormat:@"%li/%li",self.page,self.totalPage];
    self.titleLabel.text = self.pageTitle;
}

- (void)showTitle:(NSString *)title {
    self.titleLabel.text = title;
    self.pageTitle = title;
}

- (void)showAttributedText:(NSAttributedString *)text page:(NSInteger)page totalPage:(NSInteger)totalPage {
    self.text = text;
    self.textView.attributedText = text;
    self.page = page;
    self.totalPage = totalPage;
    self.pageLabel.text = [NSString stringWithFormat:@"%li/%li",page,totalPage];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
