//
//  QGTopicDetailModel.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

/** 帖子详情页的类型 */
typedef NS_ENUM(NSUInteger, QGTopicModelType) {
    QGTopicModelTypeText, // - 文字类型
    QGTopicModelTypeImage // - 图片类型
};

@interface QGTopicDetailContentModel : QGModel

/**  帖子类型 */
@property(nonatomic, assign) QGTopicModelType type;

/** cell的高度 */
@property(nonatomic, assign, readonly)CGFloat cellHeight;

@end
