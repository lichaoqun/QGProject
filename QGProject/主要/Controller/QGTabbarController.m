//
//  QGTabbarController.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTabbarController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "QGHomeVC.h"
#import "QGPublishVC.h"
#import "QGMineVC.h"
#import "QGNavigationController.h"
#import "QGTabbar.h"

@interface QGTabbarController ()<QGTabbarDelegate>

@end

@implementation QGTabbarController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // - 设置 tabbar 属性
    [self setupTabbarItemAttr];
    
    // - 初始化子视图控制器
    [self setupChildVC];
}

// - MARK: <-- 设置通用的tabbar的文字颜色 -->
-(void)setupTabbarItemAttr{
    NSDictionary * normalAttrs = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    NSDictionary *selectAttrs = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
    UITabBarItem * tabarItem = [UITabBarItem appearance];
    [tabarItem setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    [tabarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];

    QGTabbar *tabBar = [[QGTabbar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];
}

// - MARK: <-- 配置视图控制器 -->
-(void)setupChildVC{
    // - 配置隐藏导航栏
    self.fd_prefersNavigationBarHidden = YES;
    
    // - 配置视图控制器
    QGNavigationController *homeNav = [self getChildNav:[[QGHomeVC alloc]init] title:@"首页" normalImageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    QGNavigationController *mineNav = [self getChildNav:[[QGMineVC alloc]init] title:@"我的" normalImageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
    self.viewControllers = @[homeNav, mineNav];
}

/** 获取视图控制器 */
-(QGNavigationController *)getChildNav:(QGBaseVC *)vc title:(NSString *)title normalImageName:(NSString *)normalImageName selectImageName:(NSString *)selectImageName{
    
    // - 隐藏导航栏
    QGNavigationController *nav = [[QGNavigationController alloc]initWithRootViewController:vc];
    vc.fd_prefersNavigationBarHidden = YES;

    // - 配置 tabbar
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.title = title;
    item.image = [UIImage imageNamed:normalImageName];
    item.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem = item;
    return nav;
}

// - MARK: <-- 代理方法 -->
-(void)tabBarDidClickPlusButton:(QGTabbar *)tabBar{
    QGNavigationController *nav = [[QGNavigationController alloc]initWithRootViewController:[[QGPublishVC alloc]init]];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

@end
