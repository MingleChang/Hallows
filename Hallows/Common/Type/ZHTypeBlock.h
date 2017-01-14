//
//  ZHTypeBlock.h
//  Hallows
//
//  Created by Mingle on 2017/1/9.
//  Copyright © 2017年 Mingle. All rights reserved.
//

#ifndef ZHTypeBlock_h
#define ZHTypeBlock_h


#endif /* ZHTypeBlock_h */

typedef void(^zh_completionBlock)(id response, NSError *error);

typedef NS_ENUM(NSInteger, ZHReaderPageDirection) {
    ZHReaderPageDirectionUnknown    = 0,
    ZHReaderPageDirectionPrevious   = 1,
    ZHReaderPageDirectionNext       = 2
};
