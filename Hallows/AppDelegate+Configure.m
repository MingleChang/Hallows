//
//  AppDelegate+Configure.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/12.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "AppDelegate+Configure.h"
#import "ZHCommon.h"
@implementation AppDelegate (Configure)

- (void)configure_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UINavigationBar appearance] setBarTintColor:[UIColor zh_navigationColor]];
    [[UINavigationBar appearance]setTintColor:[UIColor zh_navigationItemColor]];
}

@end
