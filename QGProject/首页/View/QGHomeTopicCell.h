//
//  QGHomeTopicCell.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTableViewCell.h"
#import "QGAllHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGHomeTopicCell : QGTableViewCell

/** 帖子的 model */
@property(nonatomic, strong)QGHomeTopicModel *topicModel;


@end

NS_ASSUME_NONNULL_END
