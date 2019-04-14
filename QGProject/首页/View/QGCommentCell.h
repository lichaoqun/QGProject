//
//  QGCommentCell.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGAllTopicDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGCommentCell : UITableViewCell

/** 评论的 model */
@property(nonatomic, strong)QGTopicDetailCommentContentModel *commentModel;

@end

NS_ASSUME_NONNULL_END
