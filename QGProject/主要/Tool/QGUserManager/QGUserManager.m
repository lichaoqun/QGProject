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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTokenNULL) name:kTokenPast object:nil];
    });
    return userManager_;
}

+(void)setTokenNULL{
    [QGUserManager shareMgr].userModel.token = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kTokenSaveKey];
}

// - MARK: <-- get 方法 -->
/** token */
-(NSString *)token{
    if (userManager_.userModel.token) return userManager_.userModel.token;
    return [[NSUserDefaults standardUserDefaults]objectForKey:kTokenSaveKey];

}

// - MARK: <-- 登录页面 -->
/** 显示登录页面 */
+(void)showLoginVCComplete:(void(^)(QGUserModel *userModel))complete{
    QGNavigationController *nav = [[QGNavigationController alloc]initWithRootViewController:[[QGLoginVC alloc]initWithLoginComplete:complete]];
    [[QGControllerTool getRootNavVC] presentViewController:nav animated:YES completion:nil];
}

@end
