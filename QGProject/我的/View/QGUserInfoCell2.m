//
//  QGUserInfoCell2.m
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserInfoCell2.h"

@implementation QGUserInfoCell2

// - MARK: <-- 初始化 -->
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

// - MARK: <-- 懒加载 -->
/** 主标题 */
- (UILabel *)mainTitleLabel{
    if(!_mainTitleLabel){
        UILabel *mainTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:mainTitleLabel];
        _mainTitleLabel = mainTitleLabel;
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

/** 用户信息的 label */
- (UILabel *)subTitleLabel{
    if(!_subTitleLabel){
        UILabel *subTitleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:subTitleLabel];
        _subTitleLabel = subTitleLabel;
        subTitleLabel.textAlignment = NSTextAlignmentRight;
        subTitleLabel.font = fontNormal14();
        subTitleLabel.textColor = colorGray333333();
        
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mainTitleLabel);
            make.right.equalTo(self.contentView).offset(-20);
            make.width.mas_lessThanOrEqualTo(200);
        }];
    }
    return _subTitleLabel;
}

@end
