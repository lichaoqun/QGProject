//
//  QGCommentHeaderView.m
//  QGProject
//
//  Created by 李超群 on 2019/4/14.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGCommentHeaderView.h"

@implementation QGCommentHeaderView

// - MARK: <-- 初始化 -->
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

// - MARK: <-- 设置 UI -->
-(void)setupUI{
    self.backgroundColor = colorGrayFFFFFF();
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"精彩评论";
    titleLabel.font = fontBold16();
    titleLabel.textColor = colorGray000000();
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.left.equalTo(self).offset(kCellLRPadding);
    }]; 
}

@end
