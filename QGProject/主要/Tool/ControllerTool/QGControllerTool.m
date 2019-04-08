//
//  QGControllerTool.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGControllerTool.h"
#import "QGAppDelegate.h"

@implementation QGControllerTool
/** 获取根视图的 nav 制器 */
+(QGNavigationController *)getRootNavVC{
    QGAppDelegate *delegate = (QGAppDelegate *)[UIApplication sharedApplication].delegate;
    return (QGNavigationController *)delegate.window.rootViewController;
}

/** 获取跟视图的 tab 控制器 */
+(QGTabbarController *)getRootTabbarVC{
    QGNavigationController *nav = [self getRootNavVC];
    return (QGTabbarController *)[[nav viewControllers] firstObject];
}

@end
