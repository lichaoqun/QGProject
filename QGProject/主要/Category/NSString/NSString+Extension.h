//
//  NSString+Extension.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/** 根据时间戳 转成发布帖子的时间样式 */
+ (NSString *)formatTimeWithInterval:(NSTimeInterval)timeInterval;

@end

NS_ASSUME_NONNULL_END
