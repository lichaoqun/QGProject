//
//  QGTopicDetailCommentModel.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"
#import "QGUserModel.h"

@interface QGTopicDetailCommentModel : QGModel

/** 评论的 id */
@property(nonatomic, copy)NSString *commentID;

/**  评论的详情 */
@property(nonatomic, copy)NSString *commentDetail;

/** 评论的时间 */
@property(nonatomic, assign)NSTimeInterval commentTime;

/** 评论的用户 model */
@property(nonatomic, strong)QGUserModel *commentUserModel;

/** cell 的高度 */
@property(nonatomic, assign)CGFloat cellHei;

@end
