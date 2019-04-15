//
//  DYNewsCommentBottomView.m
//  QEZB
//
//  Created by qietv on 2017/12/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DYNewsCommentBottomView.h"

@implementation DYNewsCommentBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self stepSubCommentSubviews];
    }
    return self;
}

-(void)stepSubCommentSubviews{
    UIView* lineView=[[UIView alloc]init];;
    lineView.backgroundColor=colorGrayEFEFEF();
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(0.5));
    }];
    
    [self addSubview:self.BottomView];
    
    [self.BottomView addSubview:self.iconImageView];
    [self.BottomView addSubview:self.defaultLabel];
    self.BottomView.backgroundColor = colorGrayFFFFFF();
    self.defaultLabel.text = @"回复TA:";
    _defaultLabel.font = fontNormal14();
    _defaultLabel.textColor = colorGray333333();
    [self LayoutSubCommentView];
    [self.BottomView addTarget:self action:@selector(startComment) forControlEvents:UIControlEventTouchUpInside];
}


-(void)startComment{
    if (_delegate &&[_delegate respondsToSelector:@selector(openCommentInput)]) {
        [_delegate openCommentInput];
    }
}
-(void)LayoutSubCommentView
{
    [self.BottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.mas_top).offset(0.5);

    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.BottomView.mas_left).offset(16.5);
        make.centerY.equalTo(self.BottomView.mas_centerY);
        make.height.equalTo(@(15));
        make.width.equalTo(@(15));
        
    }];
    [self.defaultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(11);
        make.centerY.equalTo(self.BottomView.mas_centerY);
        make.height.equalTo(@(30));
        make.width.equalTo(@(80));
    }];
    
}

-(UIButton *)BottomView{
    if (!_BottomView) {
        _BottomView = [[UIButton alloc]init];
        self.BottomView.backgroundColor = colorGrayFFFFFF();
    }
    return _BottomView;
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.userInteractionEnabled = NO;
        _iconImageView.image = [UIImage imageNamed:@"topic_commont_write"];
        
    }
    return _iconImageView;
}
-(UILabel *)defaultLabel{
    if (!_defaultLabel) {
        _defaultLabel = [[UILabel alloc]init];
        _defaultLabel.userInteractionEnabled = NO;
        _defaultLabel.textColor = colorGray333333();
        _defaultLabel.font = fontNormal14();
        _defaultLabel.text = @"吐槽有节操";
        
    }
    return _defaultLabel;
}

-(UIButton *)startCommet{
    if (!_startCommet) {
        _startCommet = [UIButton buttonWithType:UIButtonTypeCustom];
        _startCommet.backgroundColor = [UIColor clearColor];
        
    }
    return _startCommet;
}
-(UIButton *)commetBtn{
    if (!_commetBtn) {
        _commetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _commetBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 27);
        _commetBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [_commetBtn setImage:[UIImage imageNamed:@"news_ic_comments"] forState:UIControlStateNormal];
        [_commetBtn setTitle:@"" forState:UIControlStateNormal];
        [_commetBtn setTitleColor:colorGray333333() forState:UIControlStateNormal];
        _commetBtn.titleLabel.font =  fontNormal14();
        _commetBtn.titleLabel.font =  fontNormal14();

    }
    return _commetBtn;
}
-(UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:[UIImage imageNamed:@"news_ic_share"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

@end
