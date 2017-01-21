//
//  ZHMacro.h
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#ifndef ZHMacro_h
#define ZHMacro_h


#define ZH_WEAK(object) __weak typeof(object) weakobject = object;
#define ZH_STRONG(object) __strong typeof(object) strongobject = object;


#define PlaceholderImage [UIImage imageNamed:@"placeholder"]

#define ZH_ScreenSize [UIScreen mainScreen].bounds.size
#define ZH_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ZH_ScreenHeight [UIScreen mainScreen].bounds.size.height

#define ZH_PageSize CGSizeMake(ZH_ScreenWidth - 16, ZH_ScreenHeight - 20 - 20)


#endif /* ZHMacro_h */
