//
//  QGTabbar.h
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QGTabbar;

@protocol QGTabbarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(QGTabbar *)tabBar;

@end

@interface QGTabbar : UITabBar

/** 按钮点击的事件监听的回调 */
@property (nonatomic, weak) id<QGTabbarDelegate> delegate;

@end
