//
//  ZHHomeController.m
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHHomeController.h"
#import "ZHCommon.h"

@interface ZHHomeController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)buttonClick:(UIButton *)sender;

- (IBAction)searchBarButtonItemClick:(UIBarButtonItem *)sender;

@end

@implementation ZHHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *lArray = [NSMutableArray array];
    for (int i=1; i<=5; i++) {
        NSString *lImageName = [NSString stringWithFormat:@"loading_%i",i];
        UIImage *lImage = [UIImage imageNamed:lImageName];
        [lArray addObject:lImage];
    }
    self.imageView.animationImages = [lArray copy];
    self.imageView.animationDuration=1/3.0;
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClick:(UIButton *)sender {
    [self performSegueWithIdentifier:ZHConstSegueIdHome2Chapter sender:nil];
}

- (IBAction)searchBarButtonItemClick:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:ZHConstSegueIdHome2Search sender:nil];
}

@end
