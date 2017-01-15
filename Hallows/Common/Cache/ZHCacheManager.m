//
//  ZHCacheManager.m
//  Hallows
//
//  Created by 常峻玮 on 17/1/16.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#import "ZHCacheManager.h"
#import "ZHCommon.h"

@interface ZHCache ()

@property (nonatomic, assign)NSTimeInterval expire;

@end

@implementation ZHCache

+ (NSArray *)mj_ignoredPropertyNames {
    return @[@"isExpire"];
}

- (BOOL)isExpire {
    if (self.expire == 0) {
        return NO;
    }
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    if (timeInterval > self.expire) {
        return NO;
    }else {
        return YES;
    }
}

+ (ZHCache *)cacheWithValue:(NSString *)value expire:(NSTimeInterval)expire {
    ZHCache *lCache = [[ZHCache alloc] init];
    lCache.value = value;
    if (expire == 0) {
        lCache.expire = 0;
    }else {
        lCache.expire = [[NSDate dateWithTimeIntervalSinceNow:expire] timeIntervalSince1970];
    }
    return lCache;
}

@end

@interface ZHCacheManager ()

@property (nonatomic, copy)NSString *cachePath;

@end

@implementation ZHCacheManager

+ (ZHCacheManager *)manager {
    static ZHCacheManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZHCacheManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure {
    NSString *lPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSAllDomainsMask, YES)[0];
    NSString *lCachePath = [lPath stringByAppendingPathComponent:@"chapterBody"];
    BOOL isDirectory = NO;
    BOOL result = [[NSFileManager defaultManager] fileExistsAtPath:lCachePath isDirectory:&isDirectory];
    if (result && isDirectory) {
        self.cachePath = lCachePath;
    }else {
        [[NSFileManager defaultManager] createDirectoryAtPath:lCachePath withIntermediateDirectories:YES attributes:nil error:nil];
        self.cachePath = lCachePath;
    }
}

- (NSString *)cacheFilePathWithKey:(NSString *)key {
    NSString *lMD5 = [key zh_md5];
    NSString *lFilePath = [self.cachePath stringByAppendingPathComponent:lMD5];
    return lFilePath;
}

- (void)cacheValue:(NSString *)value forKey:(NSString *)key expire:(NSTimeInterval)expire {
    ZHCache *lCache = [ZHCache cacheWithValue:value expire:expire];
    NSString *lString = [lCache mj_JSONString];
    NSString *lFilePath = [self cacheFilePathWithKey:key];
    [lString writeToFile:lFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (ZHCache *)cacheWithKey:(NSString *)key {
    NSString *lFilePath = [self cacheFilePathWithKey:key];
    NSString *lString = [[NSString alloc] initWithContentsOfFile:lFilePath encoding:NSUTF8StringEncoding error:nil];
    ZHCache *lCache = [ZHCache mj_objectWithKeyValues:lString];
    return lCache;
}

@end
