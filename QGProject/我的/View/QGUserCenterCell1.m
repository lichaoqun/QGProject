//
//  QGUserCenterCell1.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserCenterCell1.h"

@interface QGUserCenterCell1 ()

/** 头像按钮 */
@property(nonatomic, weak)UIImageView *headerImageView;

/** 昵称的 label */
@property(nonatomic, weak)UILabel *nickNameLabel;

/** 昵称的 label */
@property(nonatomic, weak)UILabel *userNameLabel;

@end

@implementation QGUserCenterCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

// - MARK: <-- 重写 set方法 -->
-(void)setUserModel:(QGUserModel *)userModel{
    _userModel = userModel;
    if ([QGUserManager shareMgr].token) {
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:userModel.avatar]];
        self.nickNameLabel.text = userModel.nickName;
        self.userNameLabel.text = userModel.userName;
    }else{
        self.headerImageView.image = [UIImage imageNamed:@"defautl_user_icon"];
         self.nickNameLabel.text = @"请登录";
        self.userNameLabel.text = @"登录查看更多信息";
    }
}

// - MARK: <-- 懒加载 -->
/** 头像按钮 */
- (UIImageView *)headerImageView{
    if(!_headerImageView){
        UIImageView *headerImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:headerImageView];
        CGFloat wh = 60;
        headerImageView.layer.cornerRadius = wh / 2;
        headerImageView.clipsToBounds = YES;
        _headerImageView = headerImageView;

        [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(wh, wh));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(kCellLRPadding);
        }];
    }
    return _headerImageView;
}

/** 昵称的 label */
- (UILabel *)nickNameLabel{
    if(!_nickNameLabel){
        UILabel *nickNameLabel = [[UILabel alloc] init];
        nickNameLabel.textAlignment = NSTextAlignmentLeft;
        nickNameLabel.font = fontNormal14();
        nickNameLabel.textColor = colorGray333333();
        [self.contentView addSubview:nickNameLabel];
        _nickNameLabel = nickNameLabel;
        
        [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImageView.mas_right).offset(10);
            make.top.equalTo(self.headerImageView);
            make.right.equalTo(self.contentView).offset(-30);
        }];
    }
    return _nickNameLabel;
}

- (UILabel *)userNameLabel{
    if(!_userNameLabel){
        UILabel *userNameLabel = [[UILabel alloc] init];
        userNameLabel.textAlignment = NSTextAlignmentLeft;
        userNameLabel.font = fontNormal14();
        userNameLabel.textColor = colorGray666666();
        [self.contentView addSubview:userNameLabel];
        _userNameLabel = userNameLabel;
        
        [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.nickNameLabel);
            make.bottom.equalTo(self.headerImageView);
        }];
    }
    return _userNameLabel;
}

@end
