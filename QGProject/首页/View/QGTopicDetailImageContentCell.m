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
    UIImageView *coverImageView=[[UIImageView alloc]init];
    coverImageView.backgroundColor = colorGrayFFFFFF();
    [self.contentView addSubview:coverImageView];
    self.coverImageView = coverImageView;
    
    [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, kCellLRPadding, 5, kCellLRPadding));
    }];
}

// - MARK: <-- 设置数据 -->
-(void)setImgContentModel:(QGTopicDetailImageContentModel *)imgContentModel{
    _imgContentModel = imgContentModel;
    [self.coverImageView qg_setImageWithURLStr:imgContentModel.contentAuthorIconUrl];
}

@end
