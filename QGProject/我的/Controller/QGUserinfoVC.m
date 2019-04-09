//
//  QGUserinfoVC.m
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserinfoVC.h"
#import "QGUserInfoCell1.h"
#import "QGUserInfoCell2.h"
#import "QGChangeUserInfoVC.h"
#import "ZZQAvatarPicker.h"

static NSString * const kUserinfoCell1ID = @"kUserinfoCell1ID";
static NSString * const kUserinfoCell2ID = @"kUserinfoCell2ID";

@interface QGUserinfoVC ()<UITableViewDataSource, UITableViewDelegate>

/** <#注释#> */
@property (nonatomic, weak) UITableView *userCenterTabView;

@end

@implementation QGUserinfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorGrayFFFFFF();
    self.title = @"个人信息";
    [self setupUI];
    
    // - token 过期的处理
    [self addTokenPassNoti];
}

// - MARK: <-- 绘制 UI -->
-(void)setupUI{
    UITableView *userCenterTabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    userCenterTabView.delegate = self;
    userCenterTabView.dataSource = self;
    [userCenterTabView registerClass:[QGUserInfoCell1 class] forCellReuseIdentifier:kUserinfoCell1ID];
    [userCenterTabView registerClass:[QGUserInfoCell2 class] forCellReuseIdentifier:kUserinfoCell2ID];
    [self.view addSubview:userCenterTabView];
    self.userCenterTabView = userCenterTabView;
    
    [userCenterTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

// - MARK: <-- 代理方法 -->
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        QGUserInfoCell1 *cell = [tableView dequeueReusableCellWithIdentifier:kUserinfoCell1ID forIndexPath:indexPath];
        cell.userModel = [QGUserManager shareMgr].userModel;
        return cell;
    }else{
        QGUserInfoCell2 *cell = [tableView dequeueReusableCellWithIdentifier:kUserinfoCell2ID forIndexPath:indexPath];
        if (indexPath.row == 1) {
            cell.mainTitleLabel.text = @"昵称";
            cell.subTitleLabel.text = [QGUserManager shareMgr].userModel.nickName;
        }else if (indexPath.row == 2) {
            cell.mainTitleLabel.text = @"电话";
            cell.subTitleLabel.text = [QGUserManager shareMgr].userModel.userName;
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 60;
    }else{
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self changeUserIcon];
    }else if (indexPath.row == 1){
        QGChangeUserInfoVC *changeVC = [[QGChangeUserInfoVC alloc]init];
        changeVC.changeType = QGChangeUserINfoTypeUserName;
        [self.navigationController pushViewController:changeVC animated:YES];
    }
}

// - token 过期的处理
- (void)tokenPastDo{
    [self.userCenterTabView reloadData];
}

/** 更换头像 */
-(void)changeUserIcon{
    [ZZQAvatarPicker startSelected:^(UIImage * _Nonnull image) {
//        [self.avatarBtn setImage:image forState:UIControlStateNormal];
        NSLog(@"%@", image);
    }];
}

@end
