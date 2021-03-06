//
//  QGTopicDetailTitleCell.m
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailTitleCell.h"
#import "QGTopicCategoryView.h"

@interface QGTopicDetailTitleCell ()

/** 帖子的 label */
@property (nonatomic, weak) UILabel *topicTitleLabel;

/** 分类的 label */
@property (nonatomic, weak) QGTopicCategoryView *categoryView;

/**  分类的 lable */
@property (nonatomic, weak) UILabel *timeLabel;

@end

@implementation QGTopicDetailTitleCell

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
    
    // - 帖子的 label
    UILabel *topicTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    topicTitleLabel.textColor = colorGray333333();
    topicTitleLabel.font = fontBold16();
    topicTitleLabel.numberOfLines = 0;
    [self.contentView addSubview:topicTitleLabel];
    self.topicTitleLabel = topicTitleLabel;
    
    [topicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kCellLRPadding);
        make.right.equalTo(self.contentView).offset(-kCellLRPadding);
        make.top.equalTo(self.contentView).offset(10);
    }];
    self.topicTitleLabel = topicTitleLabel;
    
    /** 分类的 label */
    QGTopicCategoryView *categoryView = [[QGTopicCategoryView alloc]init];
    [self.contentView addSubview:categoryView];
    self.categoryView = categoryView;
    
    [categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(90);
        make.left.equalTo(self.contentView).offset(kCellLRPadding);
        make.top.equalTo(topicTitleLabel.mas_bottom).offset(10);
    }];
    
    /**  发布时间 lable */
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textColor = colorGray999999();
    timeLabel.font = fontNormal12();
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(categoryView.mas_right).offset(10);
        make.bottom.equalTo(categoryView);
    }];
}

// - MARK: <-- 设置数据 -->
-(void)setTitleModel:(QGTopicDetailTitleContentModel *)titleModel{
    _titleModel = titleModel;
    self.topicTitleLabel.text = titleModel.contentTitle;
    self.categoryView.category = titleModel.cateName;
    self.timeLabel.text = [NSString formatTimeWithInterval:titleModel.contentPublishTime];
}
@end
