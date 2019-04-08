//
//  NSString+Extension.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/** 根据时间戳 转成发布帖子的时间样式 */
+ (NSString *)formatTimeWithInterval:(NSTimeInterval)timeInterval{
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDate *nowDate = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    if (publishDate.isToday) {
        //如果是今天
        int seconds = [nowDate timeIntervalSinceDate:publishDate];
        if (seconds < 60) {
            return @"刚刚";
        } else if (seconds < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟前", seconds / 60];
        } else {
            return [NSString stringWithFormat:@"%d小时前", seconds / 3600];
        }
    } else if (publishDate.isYesterday) {
        //如果是昨天 10: 10
        [dateFormatter setDateFormat:@"昨天 HH:mm"];
        return [dateFormatter stringFromDate:publishDate];
    } else {
        //是今年
        if (publishDate.year == nowDate.year) {
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            return [dateFormatter stringFromDate:publishDate];
        }else {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            return [dateFormatter stringFromDate:publishDate];
        }
    }
}
@end
