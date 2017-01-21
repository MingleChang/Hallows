//
//  ZHViewController.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHLoadingView.h"
#import "ZHCommon.h"

@interface ZHViewController ()

@property (nonatomic, strong)ZHLoadingView *loadingView;

@end

@implementation ZHViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self resetBackBarButtonItem];
    [self resetNavigationBarItems];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoading {
    if (self.loadingView) {
        [self dismissLoading];
    }
    self.loadingView = [[ZHLoadingView alloc] init];
    [self.view addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)dismissLoading {
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
}

#pragma mark - Private Mothed
- (void)resetBackBarButtonItem {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
}


- (void)resetNavigationBarItems {
    
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
