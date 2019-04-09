//
//  QGUserManager.h
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QGUserModel.h"

@interface QGUserManager : NSObject

/**  用户Model */
@property(nonatomic, strong)QGUserModel *userModel;

/** 获取 token */
@property (nonatomic, copy) NSString *token;

/** 单例初始化 */
+(instancetype)shareMgr;

/** 显示登录页面 */
+(void)showLoginVCComplete:(void(^)(QGUserModel *userModel))complete;

@end
