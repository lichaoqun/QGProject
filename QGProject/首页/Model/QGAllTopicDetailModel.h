//
//  QGAllTopicDetailModel.h
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

/** 帖子详情页的类型 */
typedef NS_ENUM(NSUInteger, QGTopicModelType) {
    QGTopicModelTypeTitle, // - 标题类型
    QGTopicModelTypeText, // - 文字类型
    QGTopicModelTypeImage // - 图片类型
};

@interface QGTopicDetailContentModel : QGModel

/**  帖子类型 */
@property(nonatomic, assign) QGTopicModelType type;

/** cell的高度 */
@property(nonatomic, assign, readonly)CGFloat cellHeight;

@end

// - MARK: <-- titleModel -->
@interface QGTopicDetailTitleContentModel : QGTopicDetailContentModel

/** 发帖的时间戳 */
@property(nonatomic, assign)NSTimeInterval createTime;

/** 发帖的标题 */
@property(nonatomic, copy)NSString *title;

/** 帖子的分类 */
@property(nonatomic, copy)NSString *category;

@end

// - MARK: <-- textModel -->
@interface QGTopicDetailTextContentModel : QGTopicDetailContentModel

/** 帖子的文字 */
@property(nonatomic, copy)NSString *content;

@end

// - MARK: <-- imageModel -->
@interface QGTopicDetailImageContentModel : QGTopicDetailContentModel

/** 图片高 */
@property(nonatomic, assign)CGFloat imgHeight;

/** 图片宽 */
@property(nonatomic, assign)CGFloat imgWidth;

/** 图片地址 */
@property(nonatomic, copy)NSString *imgUrl;

@end
