//
//  QGPublishVC.h
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGPublishChooseCategoryVC : QGBaseVC

/** 设置分类的model */
+(void)setupCategoryModels:(NSArray *)categoryModelsArray;

@end

NS_ASSUME_NONNULL_END
