//
//  QGMineVC.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGMineVC.h"
#import "QGNavigationController.h"
#import "QGUserCenterCell1.h"
#import "QGUserCenterCell2.h"
#import "QGUserinfoVC.h"
#import "QGUserManager.h"

static NSString * const kUserCenterCell1ID = @"kUserCenterCell1ID";
static NSString * const kUserCenterCell2ID = @"kUserCenterCell2ID";

@interface QGMineVC ()<UITableViewDelegate, UITableViewDataSource>

/** 个人中心的 tableView */
@property (nonatomic, weak) UITableView *userCenterTabView;

@end

@implementation QGMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorGrayFFFFFF();
    
    [self setupUI];
    // - token 过期的处理
    [self addTokenPassNoti];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.userCenterTabView reloadData];
}

// - MARK: <-- 绘制 UI -->
-(void)setupUI{
    UITableView *userCenterTabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    userCenterTabView.delegate = self;
    userCenterTabView.dataSource = self;
    [userCenterTabView registerClass:[QGUserCenterCell1 class] forCellReuseIdentifier:kUserCenterCell1ID];
    [userCenterTabView registerClass:[QGUserCenterCell2 class] forCellReuseIdentifier:kUserCenterCell2ID];
    [self.view addSubview:userCenterTabView];
    _userCenterTabView = userCenterTabView;
    [userCenterTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kIndicatorHei);
    }];
}

// - MARK: <-- 代理方法 -->
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        QGUserCenterCell1 *cell = [tableView dequeueReusableCellWithIdentifier:kUserCenterCell1ID forIndexPath:indexPath];
        cell.userModel = [QGUserManager shareMgr].userModel;
        return cell;
    }else{
        QGUserCenterCell2 *cell = [tableView dequeueReusableCellWithIdentifier:kUserCenterCell2ID forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.mainTitleLabel.text = @"我的发帖";
        }else if (indexPath.row == 1) {
            cell.mainTitleLabel.text = @"联系我们";
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![QGUserManager shareMgr].token) {
        [QGUserManager showLoginVCComplete:^(QGUserModel * _Nonnull userModel) {
            [tableView reloadData];
        }];
        return;
    }
    if (indexPath.section == 0) {
        if(indexPath.row == 0){
            QGUserinfoVC *infoVC = [[QGUserinfoVC alloc]init];
            [self.navigationController pushViewController:infoVC animated:YES];
        }
    }else if (indexPath.section == 1){
        
    }
}
@end
