//
//  ZHSearchController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHSearchController.h"
#import "ZHChapterController.h"
#import "ZHSearchBookCell.h"
#import "ZHCommon.h"
#import "ZHModel.h"

static NSString *const kSearchBookCellId = @"ZHSearchBookCellId";
static NSInteger const kPageCount = 10;

@interface ZHSearchController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy)NSString *searchKey;

@property (nonatomic, strong)NSMutableArray *books;

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
    
    [ZHUtils zh_footerWithRefreshingScrollView:self.tableView refreshingTarget:self refreshingAction:@selector(refreshFooterEventResponse:)];
}

- (void)configureData {
    self.books = [NSMutableArray array];
}

#pragma mark - Private Mothed
- (void)searchWithKey:(NSString *)key {
    self.searchKey = key;
    
    [self.books removeAllObjects];
    [self.tableView reloadData];
    
    ZH_WEAK(self);
    [[ZHDatabase database] searchKey:self.searchKey start:self.books.count count:kPageCount completion:^(NSArray *response, NSError *error) {
        ZH_STRONG(weakobject);
        [strongobject.books addObjectsFromArray:response];
        [strongobject.tableView reloadData];
        if (response.count < kPageCount) {
            [strongobject.tableView.mj_footer endRefreshingWithNoMoreData];
        }else {
            [strongobject.tableView.mj_footer resetNoMoreData];
        }
    }];
}

#pragma mark - Event Response
- (void)refreshFooterEventResponse:(MJRefreshFooter *)sender {
    ZH_WEAK(self);
    [[ZHDatabase database] searchKey:self.searchKey start:self.books.count count:kPageCount completion:^(NSArray *response, NSError *error) {
        ZH_STRONG(weakobject);
        [strongobject.books addObjectsFromArray:response];
        [strongobject.tableView reloadData];
        if (response.count < kPageCount) {
            [strongobject.tableView.mj_footer endRefreshingWithNoMoreData];
        }else {
            [strongobject.tableView.mj_footer endRefreshing];
        }
    }];
}

#pragma mark - Delegate
#pragma mark - SearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self searchWithKey:searchBar.text];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHBookModel *lBook = [self.books objectAtIndex:indexPath.row];
    ZHSearchBookCell *lCell = [tableView dequeueReusableCellWithIdentifier:kSearchBookCellId forIndexPath:indexPath];
    [lCell setupBookModel:lBook];
    return lCell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHBookModel *lBook = [self.books objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:ZHConstSegueIdSearch2Chapter sender:lBook];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:ZHConstSegueIdSearch2Chapter]) {
        ZHChapterController *lChapterController = (ZHChapterController *)segue.destinationViewController;
        lChapterController.bookModel = sender;
    }
}


@end
