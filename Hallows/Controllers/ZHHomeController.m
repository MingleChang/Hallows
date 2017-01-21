//
//  ZHHomeController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHHomeController.h"
#import "ZHReaderController.h"
#import "ZHChapterController.h"
#import "ZHBookCell.h"
#import "ZHCommon.h"
#import "ZHModel.h"

static NSString *const kBookCellId = @"ZHBookCellId";

@interface ZHHomeController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *books;
@property (nonatomic, assign) BOOL isEdit;

- (IBAction)editBarButtonItemClick:(UIBarButtonItem *)sender;
- (IBAction)searchBarButtonItemClick:(UIBarButtonItem *)sender;

@end

@implementation ZHHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self updateMyBook];
}

#pragma mark - Private
- (void)updateMyBook {
    [self showLoading];
    ZH_WEAK(self);
    [[ZHDatabase database] queryMyBooksCompletion:^(NSArray *response, NSError *error) {
        ZH_STRONG(weakobject);
        [strongobject dismissLoading];
        strongobject.books = [response mutableCopy];
        [strongobject.collectionView reloadData];
    }];
}

- (void)startReadByBook:(ZHBookModel *)book {
    UIStoryboard *lStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ZHChapterController *lChapterController = [lStoryboard instantiateViewControllerWithIdentifier:ZHMainStoryboardChapterId];
    lChapterController.bookModel = book;
    
    ZHReaderController *lReaderController = [lStoryboard instantiateViewControllerWithIdentifier:ZHMainStoryboardReaderId];
    lReaderController.bookId = book.id;
    lReaderController.address = book.lastChapter;
    
    NSArray *lViewControllers = self.navigationController.viewControllers;
    lViewControllers = [lViewControllers arrayByAddingObject:lChapterController];
    lViewControllers = [lViewControllers arrayByAddingObject:lReaderController];
    [self.navigationController setViewControllers:lViewControllers animated:YES];
}

#pragma mark - Delegate
#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.books.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    ZHBookModel *lBook = [self.books objectAtIndex:row];
    ZHBookCell *lCell = [collectionView dequeueReusableCellWithReuseIdentifier:kBookCellId forIndexPath:indexPath];
    [lCell setupBook:lBook];
    [lCell setupIsDelete:self.isEdit];
    ZH_WEAK(self);
    [lCell setDeleteBlock:^{
        ZH_STRONG(weakobject);
        [strongobject.books removeObject:lBook];
        [[ZHDatabase database] cleanBookRecord:lBook.id completion:nil];
        [strongobject.collectionView reloadData];
    }];
    return lCell;
}
#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (self.isEdit) {
        return;
    }
    ZHBookModel *lBook = [self.books objectAtIndex:indexPath.row];
    
    [self startReadByBook:lBook];
}

#pragma mark - UICollectionView Delegate FlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (ZH_ScreenWidth - 40) / 3;
    CGFloat height = width / 4 * 5 + 40;
    return CGSizeMake(width, height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


#pragma mark - Event Response
- (IBAction)editBarButtonItemClick:(UIBarButtonItem *)sender {
    self.isEdit = !self.isEdit;
    self.navigationItem.leftBarButtonItem.title = self.isEdit?@"完成":@"编辑";
    [self.collectionView reloadData];
}
- (IBAction)searchBarButtonItemClick:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:ZHConstSegueIdHome2Search sender:nil];
}

@end
