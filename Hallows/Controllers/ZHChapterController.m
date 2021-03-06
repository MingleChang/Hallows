//
//  ZHChapterController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHChapterController.h"
#import "ZHReaderController.h"
#import "ZHCommon.h"
#import "ZHModel.h"

@interface ZHChapterController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy)NSArray *chapters;

@end

@implementation ZHChapterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configure];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
}

- (void)configureData {
    [self showLoading];
    ZH_WEAK(self);
    [ZHParse parseChapterListWithAddress:self.bookModel.chapter completion:^(id response, NSError *error) {
        [self dismissLoading];
        ZH_STRONG(weakobject);
        NSArray *lArray = (NSArray *)response;
        strongobject.chapters = lArray;
        [strongobject.tableView reloadData];
    }];
}

#pragma mark - Delegate 
#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.chapters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHChapterModel *lChapter = [self.chapters objectAtIndex:indexPath.row];
    UITableViewCell *lCell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    lCell.textLabel.text = lChapter.name;
//    lCell.detailTextLabel.text = lChapter.address;
    return lCell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZHChapterModel *lChapter = [self.chapters objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:ZHConstSegueIdChapter2Reader sender:lChapter];
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:ZHConstSegueIdChapter2Reader]) {
        ZHReaderController *lViewController = (ZHReaderController *)segue.destinationViewController;
        ZHChapterModel *lChapter = (ZHChapterModel *)sender;
        lViewController.bookId = self.bookModel.id;
        lViewController.address = lChapter.address;
    }
}

#pragma mark - Override
- (void)resetNavigationBarItems {
    self.navigationItem.title = self.bookModel.title;
}

@end
