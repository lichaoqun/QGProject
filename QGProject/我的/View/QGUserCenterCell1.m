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
@property(nonatomic, weak)UILabel *nameLabel;

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
        self.nameLabel.text = userModel.nickName;
    }else{
        self.headerImageView.image = [UIImage imageNamed:@"xx"];
         self.nameLabel.text = @"请登录";
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
            make.left.equalTo(self.contentView).offset(18);
        }];
    }
    return _headerImageView;
}

/** 昵称的 label */
- (UILabel *)nameLabel{
    if(!_nameLabel){
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImageView.mas_right).offset(10);
            make.centerY.equalTo(self.headerImageView);
            make.right.equalTo(self.contentView).offset(-30);
        }];
    }
    return _nameLabel;
}

@end
