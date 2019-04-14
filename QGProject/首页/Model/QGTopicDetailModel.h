//
//  QGTopicDetailModel.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGAllTopicDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGTopicDetailModel : QGModel

/** 帖子 id */
@property(nonatomic, copy)NSString *contentId;

/** 标题的Model */
@property (nonatomic, strong) QGTopicDetailTitleContentModel *content;

/** 发布人的信息 */
@property(nonatomic, strong)QGUserModel *user;

/** 文字content 数组 */
@property(nonatomic, strong)NSArray <QGTopicDetailTextContentModel *>*contentLinkSummaries;

/** 图片发布人的信息 */
@property(nonatomic, strong)NSArray <QGTopicDetailImageContentModel *>*contentLinkPhotos;

@end

NS_ASSUME_NONNULL_END
