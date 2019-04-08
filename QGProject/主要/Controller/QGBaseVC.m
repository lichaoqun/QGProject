//
//  QGViewController.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGBaseVC.h"

@interface QGBaseVC ()

@end

@implementation QGBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)addTokenPassNoti{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenPastDo) name:kTokenPast object:nil];
}

-(void)tokenPastDo{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
