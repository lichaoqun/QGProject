//
//  QGTopicDetailImageContetCell.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailImageContentCell.h"

@interface QGTopicDetailImageContentCell ()

/** 图片的 view */
@property(nonatomic,weak)UIImageView *coverImageView;

@end

@implementation QGTopicDetailImageContentCell

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
    // - 图片
    UIImageView *coverImageView=[[UIImageView alloc]init];;
    coverImageView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:coverImageView];
    self.coverImageView = coverImageView;
    
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
    }];
}

// - MARK: <-- 设置数据 -->
-(void)setImgContentModel:(QGTopicDetailImageContentModel *)imgContentModel{
    _imgContentModel = imgContentModel;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:imgContentModel.imgUrl]];
}

@end
