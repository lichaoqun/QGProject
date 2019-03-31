//
//  QGMineVC.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGMineVC.h"
#import "QGArticleVC.h"
#import "QGNavigationController.h"

@interface QGMineVC ()

@end

@implementation QGMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    QGArticleVC *vc = [[QGArticleVC alloc]init];
    QGNavigationController *nav = [[QGNavigationController alloc]initWithRootViewController:vc];
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
