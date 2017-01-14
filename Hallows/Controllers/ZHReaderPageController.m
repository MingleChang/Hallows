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

@end

@implementation ZHReaderPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configure];
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
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.textView = [[ZHTextView alloc] init];
    self.textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)configureData {
    self.textView.attributedText = self.text;
}

- (void)showAttributedText:(NSAttributedString *)text page:(NSInteger)page totalPage:(NSInteger)totalPage {
    self.text = text;
    self.textView.attributedText = text;
    self.page = page;
    self.totalPage = totalPage;
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
