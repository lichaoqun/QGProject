//
//  QGUserCenterCell2.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserCenterCell2.h"

@implementation QGUserCenterCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

// - MARK: <-- 懒加载 -->
/** 标题 label */
- (UILabel *)mainTitleLabel{
    if(!_mainTitleLabel){
        UILabel *mainTitleLabel = [[UILabel alloc] init];
        mainTitleLabel.textAlignment = NSTextAlignmentLeft;
        mainTitleLabel.font = [UIFont systemFontOfSize:16];
        mainTitleLabel.textColor = [UIColor colorWithHexString:@"000000"];
        [self.contentView addSubview:mainTitleLabel];
        _mainTitleLabel = mainTitleLabel;
        
        [mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kCellLRPadding);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return _mainTitleLabel;
}

@end
