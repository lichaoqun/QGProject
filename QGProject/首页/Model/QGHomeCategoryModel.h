//
//  QGHomeCategoryModel.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGHomeCategoryModel : QGModel

/** 分类的 id */
@property(nonatomic, copy)NSString *cate_id;

/** 分类的名字 */
@property(nonatomic, copy)NSString *cate_name;

/** 分类的图片的地址 */
@property(nonatomic, copy)NSString *cate_icon_url;

@end

NS_ASSUME_NONNULL_END
