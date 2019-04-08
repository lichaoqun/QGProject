//
//  QGControllerTool.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QGNavigationController.h"
#import "QGTabbarController.h"
NS_ASSUME_NONNULL_BEGIN

@interface QGControllerTool : NSObject

/** 获取根视图的 nav 制器 */
+(QGNavigationController *)getRootNavVC;

/** 获取跟视图的 tab 控制器 */
+(QGTabbarController *)getRootTabbarVC;

@end

NS_ASSUME_NONNULL_END
