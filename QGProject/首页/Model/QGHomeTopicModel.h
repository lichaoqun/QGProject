//
//  QGHomeTopicModel.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGHomeTopicModel : QGModel

/** 帖子内容的 id */
@property(nonatomic, copy)NSString *content_id;

/** 帖子内容的标题 */
@property(nonatomic, copy)NSString *content_title;

/** 帖子内容的简介 */
@property(nonatomic, copy)NSString *content_summary;

/** 帖子内容的图片 */
@property(nonatomic, copy)NSString *content_img_url;

/** 帖子内容的作者的头像 */
@property(nonatomic, copy)NSString *content_author_icon_url;

/** 帖子内容的作者的昵称 */
@property(nonatomic, copy)NSString *content_author_name;

/** 帖子内容的发布时间 */
@property(nonatomic, assign)NSTimeInterval content_publish_time;

/** 帖子内容的分类 */
@property(nonatomic, copy)NSString *content_publish_cate;

/** 是否是图片模式的 cell */
@property(nonatomic, assign, readonly)BOOL showDesImageView;

/** 格式化后的时间间隔 */
@property(nonatomic, copy, readonly)NSString *formatTimeInterval;

/** cell的高度 */
@property(nonatomic, assign)CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
