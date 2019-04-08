//
//  QGLoginVC.h
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGLoginVC : QGBaseVC

/** 初始化登录页面和登陆成功的回调 */
- (instancetype)initWithLoginComplete:(void(^)(QGUserModel *userModel))complete;

@end

NS_ASSUME_NONNULL_END
