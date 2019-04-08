//
//  QGHomeTopicModel.m
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeTopicModel.h"

@implementation QGHomeTopicModel

-(BOOL)showDesImageView{
    return self.content_img_url;
}

- (NSString *)formatTimeInterval{
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:1522897936];
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


-(NSString *)content_author_name{
    return @"我就说这两天天气不错";
}
/** 帖子内容的标题 */
- (NSString *)content_title{
    return @"二手房急售测试测试测试测试测试测试测试测试测试测试测试测试测试";
}

/** 帖子内容的简介 */
- (NSString *)content_summary{
    return @"测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容";
}

/** 帖子内容的图片 */
- (NSString *)content_img_url{
//    return nil;
    return @"http://upstatic.qiecdn.com/upload/homeset/201904011524085965.jpg";
    return ((random() % 3) == 1) ? nil : @"http://upstatic.qiecdn.com/upload/homeset/201904011524085965.jpg";
}

- (NSString *)content_author_icon_url{
    return @"http://upstatic.qiecdn.com/upload/homeset/201904011524085965.jpg";
}

/** 帖子内容的发布时间 */
//@property(nonatomic, assign)NSTimeInterval content_publish_time;

/** 帖子内容的分类 */
- (NSString *)content_publish_cate{
    return @"二手交易";
}

@end
