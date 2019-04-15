//
//  QGTopicDetailVC.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGBaseVC.h"
#import "QGAllHomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QGTopicDetailVC : QGBaseVC

/** 帖子的 model */
@property(nonatomic, strong)QGHomeTopicModel *topicModel;

@end

NS_ASSUME_NONNULL_END
