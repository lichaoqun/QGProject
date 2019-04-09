//
//  QGUserInfoCell.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserInfoCell1.h"

@implementation QGUserInfoCell1

// - MARK: <-- 懒加载 -->
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

// - MARK: <-- 设置用户信息 -->
-(void)setUserModel:(QGUserModel *)userModel{
    _userModel = userModel;
    [self.userIconImageView sd_setImageWithURL:[NSURL URLWithString:userModel.avatar]];
}

// - MARK: <-- 懒加载 -->
/** 主标题 */
- (UILabel *)mainTitleLabel{
    if(!_mainTitleLabel){
        UILabel *mainTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:mainTitleLabel];
        _mainTitleLabel = mainTitleLabel;
        mainTitleLabel.text = @"头像";
        mainTitleLabel.textAlignment = NSTextAlignmentLeft;
        mainTitleLabel.font = fontNormal16();
        mainTitleLabel.textColor = colorGray000000();

        [mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kCellLRPadding);
            make.centerY.equalTo(self.contentView);
        }];

    }
    return _mainTitleLabel;
}

/** 用户头像 */
- (UIImageView *)userIconImageView{
    if(!_userIconImageView){
        UIImageView *userIconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:userIconImageView];
        _userIconImageView = userIconImageView;
        CGFloat wh = 40;
        userIconImageView.layer.cornerRadius = wh / 2;
        userIconImageView.clipsToBounds = YES;
        
        [userIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(wh, wh));
            make.centerY.equalTo(self.mainTitleLabel);
            make.right.equalTo(self.contentView).offset(-20);
        }];
    }
    return _userIconImageView;

}

@end
