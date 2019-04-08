//
//  QGUserManager.m
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserManager.h"
#import "QGLoginVC.h"
#import "QGNavigationController.h"

@implementation QGUserManager

// - MARK: <-- 初始化 -->
/** 单例初始化 */
static QGUserManager *userManager_;
+(instancetype)shareMgr{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userManager_ = [[QGUserManager alloc]init];
    });
    return userManager_;
}

// - MARK: <-- 登录页面 -->
/** 显示登录页面 */
+(void)loginComplete:(void(^)(QGUserModel *userModel))complete{
    QGNavigationController *nav = [[QGNavigationController alloc]initWithRootViewController:[[QGLoginVC alloc]init]];
    [[QGControllerTool getRootNavVC] presentViewController:nav animated:YES completion:nil];
}

@end
