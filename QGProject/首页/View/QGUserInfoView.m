//
//  QGUserInfoView.m
//  QGProject
//
//  Created by QG on 2019/4/9.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserInfoView.h"

@interface QGUserInfoView ()

/** 头像按钮 */
@property(nonatomic, weak)UIImageView *avatarImageView;

/**  用户名 label */
@property(nonatomic, weak)UILabel *userNameLabel;

/**  用户手机号 label */
@property(nonatomic, weak)UILabel *userPhoneNumLabel;

/**  拨号按钮 */
@property(nonatomic, weak)UIButton *callButton;

/** 删除按钮 */
@property(nonatomic, weak)UIButton *deleteButton;


@end

@implementation QGUserInfoView

// - MARK: <-- 初始化 -->
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = colorGrayFFFFFF();
    }
    return self;
}

// - MARK: <-- 重写set -->
/** 赋值 model */
-(void)setUserModel:(QGUserModel *)userModel{
    _userModel = userModel;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:userModel.avatar]];
    self.userNameLabel.text = userModel.nickName;
    self.userPhoneNumLabel.text = userModel.userName;
    [self callButton];
}

// - MARK: <-- 懒加载 -->
/** 头像按钮 */
- (UIImageView *)avatarImageView{
    if(!_avatarImageView){
        CGFloat imgWH = 40;
        UIImageView *avatarImageView = [[UIImageView alloc] init];
        avatarImageView.clipsToBounds = YES;
        avatarImageView.layer.cornerRadius = imgWH / 2;
        [self addSubview:avatarImageView];
        _avatarImageView = avatarImageView;
        
        [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(imgWH, imgWH));
            make.left.equalTo(self).offset(kCellLRPadding);
            make.centerY.equalTo(self);
        }];
    }
    return _avatarImageView;
}

/**  用户名 label */
- (UILabel *)userNameLabel{
    if(!_userNameLabel){
        UILabel *userNameLabel = [[UILabel alloc] init];
        userNameLabel.textColor = colorGray333333();
        userNameLabel.textAlignment = NSTextAlignmentLeft;
        userNameLabel.font = fontNormal14();
        [self addSubview:userNameLabel];
        _userNameLabel = userNameLabel;
        
        [userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarImageView.mas_right).offset(10);
            make.top.equalTo(self.avatarImageView);
            make.right.equalTo(self.callButton.mas_left).offset(-10);
        }];
    }
    return _userNameLabel;
}

/**  用户手机号 label */
- (UILabel *)userPhoneNumLabel{
    if(!_userPhoneNumLabel){
        UILabel *userPhoneNumLabel = [[UILabel alloc] init];
        userPhoneNumLabel.textColor = colorGray666666();
        userPhoneNumLabel.textAlignment = NSTextAlignmentLeft;
        userPhoneNumLabel.font = fontNormal12();
        [self addSubview:userPhoneNumLabel];
        _userPhoneNumLabel = userPhoneNumLabel;
        
        [userPhoneNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userNameLabel);
            make.bottom.equalTo(self.avatarImageView);
            make.right.equalTo(self.callButton.mas_left).offset(-10);
        }];
    }
    return _userPhoneNumLabel;
}

/**  拨号按钮 */
- (UIButton *)callButton{
    if(!_callButton){
        UIButton *callButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [callButton setTitle:@"联系TA" forState:UIControlStateNormal];
        [callButton setTitleColor:colorRedCD3700() forState:UIControlStateNormal];
        callButton.titleLabel.font = fontNormal14();
        [self addSubview:callButton];
        _callButton = callButton;
        
        [callButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.deleteButton);
            make.right.equalTo(self.deleteButton.mas_left).offset(-10);
            make.centerY.equalTo(self.deleteButton);
        }];
    }
    return _callButton;
}

/** 删除按钮 */
- (UIButton *)deleteButton{
    if(!_deleteButton){
        UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [deleteButton setTitleColor:colorRedCD3700() forState:UIControlStateNormal];
        deleteButton.titleLabel.font = fontNormal14();
        [self addSubview:deleteButton];
        _deleteButton = deleteButton;
        
        [deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 40));
            make.right.equalTo(self).offset(-kCellLRPadding);
            make.centerY.equalTo(self);
        }];
    }
    return _deleteButton;
}

@end
