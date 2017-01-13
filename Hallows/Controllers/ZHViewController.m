//
//  ZHViewController.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHViewController ()

@end

@implementation ZHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self resetBackBarButtonItem];
    [self resetNavigationBarItems];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self resetNavigationBarWithAnimated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Mothed
- (void)resetBackBarButtonItem {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)resetNavigationBarWithAnimated:(BOOL)animated {
    BOOL isHidden = [self navigationBarNeedHidden];
    [self.navigationController setNavigationBarHidden:isHidden animated:animated];
}

- (BOOL)navigationBarNeedHidden {
    return NO;
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
