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

-(NSTimeInterval)content_publish_time{
    return 1522897936;
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
