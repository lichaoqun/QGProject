//
//  QGTopicDetailTextContetCell.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailTextContentCell.h"

@interface QGTopicDetailTextContentCell ()

/** 文字的 label */
@property(nonatomic, weak)UILabel *textContentLable;

@end

@implementation QGTopicDetailTextContentCell

// - MARK: <-- 初始化 -->
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setupUI];
    }
    return self;
}

// - MARK: <-- 设置 UI -->
-(void)setupUI{
    UILabel *textContentLable=[[UILabel alloc]init];
    textContentLable.font = fontNormal16();
    textContentLable.textColor = colorGray333333();
    textContentLable.numberOfLines = 0;
    textContentLable.textAlignment=NSTextAlignmentLeft;
    textContentLable.lineBreakMode = NSLineBreakByWordWrapping;
    textContentLable.text=@"";
    [self.contentView addSubview:textContentLable];
    self.textContentLable = textContentLable;
    
    [textContentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kCellLRPadding);
        make.right.equalTo(self.contentView).offset(-kCellLRPadding);
        make.top.equalTo(self.contentView).offset(10);
    }];
}

// - MARK: <-- 设置数据 -->
-(void)setTextContentModel:(QGTopicDetailTextContentModel *)textContentModel{
    _textContentModel = textContentModel;
    self.textContentLable.text = textContentModel.content;
}

@end
