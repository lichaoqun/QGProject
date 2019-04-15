//
//  QGAppDelegate+Extension.m
//  QGProject
//
//  Created by 李超群 on 2019/4/11.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGAppDelegate+Extension.h"

@implementation QGAppDelegate (Extension)

/** 设置一些初始化 */
- (void) dy_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    // - 更新用户信息 
    [QGUserManager refreshUserInfo];
    
#if DEBUG
    [self openDebug];
#else
#endif
}

/** 打开调试 */
-(void)openDebug{
    [PPNetworkHelper openLog];
}
@end
