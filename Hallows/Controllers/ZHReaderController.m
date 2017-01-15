//
//  ZHReaderController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHReaderController.h"
#import "ZHReaderPageController.h"
#import "ZHCommon.h"
#import "ZHModel.h"
#import "ZHTextView.h"

@interface ZHReaderController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong)UIPageViewController *pageController;

@property (nonatomic, strong)ZHChapterBodyModel *chapterBody;
@property (nonatomic, assign)ZHReaderPageDirection pageDirection;
@property (nonatomic, copy)NSArray *pages;
@property (nonatomic, assign)NSInteger pageIndex;
@property (nonatomic, assign)BOOL needUpdate;

@end

@implementation ZHReaderController

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
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    [self.view addSubview:self.pageController.view];
    [self addChildViewController:self.pageController];
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    ZHReaderPageController *lReaderPage = [[ZHReaderPageController alloc] init];
    [self.pageController setViewControllers:@[lReaderPage] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)configureData {
    [self requestChapterBodyWithAddress:self.address];
}

- (void)showTextByRequest {
    NSArray *lViewControllers = self.pageController.viewControllers;
    ZHReaderPageController *lReaderPage = lViewControllers[0];
    if (self.pageDirection == ZHReaderPageDirectionPrevious) {
        self.pageIndex = self.pages.count;
        [lReaderPage showAttributedText:self.pages.lastObject page:self.pageIndex totalPage:self.pages.count];
    }else {
        self.pageIndex = 1;
        [lReaderPage showAttributedText:self.pages.firstObject page:self.pageIndex totalPage:self.pages.count];
    }
    self.navigationItem.title = self.chapterBody.title;
    self.pageDirection = ZHReaderPageDirectionUnknown;
    [self dismissLoading];
}

- (void)pageChapterBody {
    ZH_WEAK(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ZH_STRONG(weakobject);
        strongobject.pages = [strongobject.chapterBody pages];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [strongobject showTextByRequest];
        });
        
    });
}

#pragma mark - Request
- (void)requestChapterBodyWithAddress:(NSString *)address {
    [self showLoading];
    ZH_WEAK(self);
    [ZHParse parseChapterBodyWithAddress:address completion:^(id response, NSError *error) {
        ZH_STRONG(weakobject);
        ZHChapterBodyModel *lChapterBody = (ZHChapterBodyModel *)response;
        if (![lChapterBody isValid]) {
            if (self.pageDirection == ZHReaderPageDirectionPrevious) {
                lChapterBody.nextAddress = strongobject.chapterBody.address;
            }
            if (self.pageDirection == ZHReaderPageDirectionNext) {
                lChapterBody.preAddress = strongobject.chapterBody.address;
            }
        }
        
        strongobject.chapterBody = lChapterBody;
        [strongobject pageChapterBody];
        [strongobject advanceRequestChapterBody];
    }];
}

- (void)advanceRequestChapterBody {
    if ([self.chapterBody hasPre]) {
        [ZHParse parseChapterBodyWithAddress:self.chapterBody.preAddress completion:nil];
    }
    if ([self.chapterBody hasNext]) {
        [ZHParse parseChapterBodyWithAddress:self.chapterBody.nextAddress completion:nil];
    }
}

#pragma mark - Delegate
#pragma mark - UIPageViewController DataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if (self.pageIndex <= 1 && ![self.chapterBody hasPre]) {
        return nil;
    }
    //向前
    ZHReaderPageController *lReaderPage = [[ZHReaderPageController alloc] init];
    
    if (self.pageIndex <= 1) {
        self.pageDirection = ZHReaderPageDirectionPrevious;
        lReaderPage.text = nil;
        lReaderPage.page = 0;
    }else {
//        self.pageDirection = ZHReaderPageDirectionPrevious;
        lReaderPage.text = self.pages[self.pageIndex - 2];
        self.pageIndex --;
    }
    
    return lReaderPage;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if (self.pageIndex >= self.pages.count && ![self.chapterBody hasNext]) {
        return nil;
    }
    //向后
    ZHReaderPageController *lReaderPage = [[ZHReaderPageController alloc] init];
    if (self.pageIndex >= self.pages.count) {
        self.pageDirection = ZHReaderPageDirectionNext;
        lReaderPage.text = nil;
        lReaderPage.page = 0;
    }else {
//        self.pageDirection = ZHReaderPageDirectionNext;
        lReaderPage.text = self.pages[self.pageIndex];
        self.pageIndex ++;
    }
    return lReaderPage;
}

#pragma mark - UIPageViewController Delegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (self.pageDirection == ZHReaderPageDirectionPrevious) {
        [self requestChapterBodyWithAddress:self.chapterBody.preAddress];
    }else if(self.pageDirection == ZHReaderPageDirectionNext) {
        [self requestChapterBodyWithAddress:self.chapterBody.nextAddress];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Event Response

@end
