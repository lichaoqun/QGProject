//
//  QGTopicDetailImageModel.h
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailContentModel.h"

@interface QGTopicDetailImageContentModel : QGTopicDetailContentModel

/** 图片高 */
@property(nonatomic, assign)CGFloat imgHeight;

/** 图片宽 */
@property(nonatomic, assign)CGFloat imgWidth;

/** 图片地址 */
@property(nonatomic, copy)NSString *imgUrl;

@end
