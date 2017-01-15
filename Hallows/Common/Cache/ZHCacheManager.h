//
//  ZHCacheManager.h
//  Hallows
//
//  Created by 常峻玮 on 17/1/16.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHCache : NSObject

@property (nonatomic, copy)NSString *value;
@property (nonatomic, assign, readonly)BOOL isExpire;

@end

@interface ZHCacheManager : NSObject
+ (ZHCacheManager *)manager;
- (void)cacheValue:(NSString *)value forKey:(NSString *)key expire:(NSTimeInterval)expire;
- (ZHCache *)cacheWithKey:(NSString *)key;
@end
