//
//  ZHReaderController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHReaderController.h"
#import "ZHCommon.h"
#import "ZHModel.h"
@interface ZHReaderController ()

@property (nonatomic, strong)ZHChapterBodyModel *chapterBody;

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)preButtonClick:(UIButton *)sender;
- (IBAction)nextButtonClick:(UIButton *)sender;

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
    
}

- (void)configureData {
    [self requestChapterBodyWithAddress:self.address];
}

#pragma mark - Request
- (void)requestChapterBodyWithAddress:(NSString *)address {
    ZH_WEAK(self);
    [ZHParse parseChapterBodyWithAddress:address completion:^(id response, NSError *error) {
        ZH_STRONG(weakobject);
        strongobject.chapterBody = (ZHChapterBodyModel *)response;
        strongobject.textView.text = strongobject.chapterBody.content;
    }];
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
- (IBAction)preButtonClick:(UIButton *)sender {
    if ([self.chapterBody hasPre]) {
        [self requestChapterBodyWithAddress:self.chapterBody.preAddress];
    }
}

- (IBAction)nextButtonClick:(UIButton *)sender {
    if ([self.chapterBody hasNext]) {
        [self requestChapterBodyWithAddress:self.chapterBody.nextAddress];
    }
}
@end
