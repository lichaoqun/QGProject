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
@property(nonatomic, copy)NSString *topicID;

/** content 数组 */
@property(nonatomic, strong)NSArray <QGTopicDetailContentModel *>*content;

/** 标题的Model */
@property (nonatomic, strong) QGTopicDetailTitleContentModel *titleModel;

/** 发布人的信息 */
@property(nonatomic, strong)QGUserModel *publishUser;

@end

NS_ASSUME_NONNULL_END
