//
//  QGHomeSlierModel.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGHomeSlierModel : QGModel

/** slider 图片 URL */
@property(nonatomic, copy)NSString *slider_url;

/** slider 的 id */
@property(nonatomic, copy)NSString *slider_id;

/** slider 的 标题 */
@property(nonatomic, copy)NSString *slider_title;

@end

NS_ASSUME_NONNULL_END
