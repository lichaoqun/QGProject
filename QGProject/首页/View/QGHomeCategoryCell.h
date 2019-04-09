//
//  QGHomeCategoryCell.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTableViewCell.h"
#import "QGAllHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN int const itemCountPerRow;

@interface QGHomeCategoryCell : QGTableViewCell

/** 轮播图的数组 */
@property(nonatomic, strong)NSArray <QGHomeCategoryModel *> *categoryModelsArray;

@end

NS_ASSUME_NONNULL_END
