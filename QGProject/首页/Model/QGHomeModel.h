//
//  QGHomeModel.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"
#import "QGAllHomeModel.h"

/** 数据类型 轮播图, 分类, 帖子 */
typedef NS_ENUM(NSInteger, QGHomeDataType) {
    QGHomeDataTypeSlider,
    QGHomeDataTypeCategory,
    QGHomeDataTypeTopic,
};

@interface QGHomeModel : QGModel

/** 数据类型 */
@property(nonatomic, assign)QGHomeDataType dataType;

/** 数据标题 */
@property(nonatomic, copy)NSString *dataTitle;

/** 数据的内容 */
@property(nonatomic, strong)NSArray *dataContent;

@end
