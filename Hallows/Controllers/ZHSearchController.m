//
//  ZHSearchController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHSearchController.h"

@interface ZHSearchController () <UISearchBarDelegate>

@property (nonatomic, strong)UISearchBar *searchBar;

@end

@implementation ZHSearchController

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
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
}

- (void)configureData {
    
}

#pragma mark - Delegate
#pragma mark - SearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
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
