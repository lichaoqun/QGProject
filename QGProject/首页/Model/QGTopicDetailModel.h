//
//  QGTopicDetailModel.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGTopicDetailContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGTopicDetailModel : QGModel

/** 帖子 id */
@property(nonatomic, copy)NSString *topicID;

/** content 数组 */
@property(nonatomic, strong)NSArray <QGTopicDetailContentModel *>*content;

/** 发帖的时间戳 */
@property(nonatomic, assign)NSTimeInterval creatTime;

/** 帖子的标题 */
@property(nonatomic, copy)NSString *title;

@end

NS_ASSUME_NONNULL_END
