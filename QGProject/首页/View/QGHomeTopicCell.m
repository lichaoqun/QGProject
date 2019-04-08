//
//  QGHomeTopicCell.m
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeTopicCell.h"


@interface QGHomeTopicCell ()

/** 标题的 label */
@property(nonatomic, weak)UILabel *topicTitleLabel;

/** 发布时间的 label */
@property(nonatomic, weak)UILabel *publishTimeLabel;

/** 帖子的详细信息 */
@property(nonatomic, weak)UILabel *topicDetailTitleLabel;

/** 帖子的图片描述 */
@property(nonatomic, weak)UIImageView *topicDesImageView;

/** 发布者的头像 */
@property(nonatomic, weak) UIImageView *author_iconImageView;

/** 发布者的昵称 */
@property(nonatomic, weak)UILabel *author_nameLabel;

/** 标签的 icon */
@property(nonatomic, weak)UIImageView *tagImageView;

/** 分类的名称 */
@property(nonatomic, weak)UILabel *categoryLabel;

@end


@implementation QGHomeTopicCell

// - MARK: <-- 重写 set 方法 -->
-(void)setTopicModel:(QGHomeTopicModel *)topicModel{
    _topicModel = topicModel;

    CGFloat topH = 40;
    CGFloat bottonH = 30;
    CGFloat originalHei = topH + bottonH;
    // - 详情的图片
    if (!topicModel.showDesImageView) {
        [self.topicDesImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeZero);
            make.right.equalTo(self.contentView);
        }];
        
        // - 计算 cell 行高
        CGFloat hei = [topicModel.content_summary boundingRectWithSize:CGSizeMake(self.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.topicDetailTitleLabel.font} context:nil].size.height;
        CGFloat maxH = 50;
        originalHei += MIN(hei, maxH);
        [self.topicDetailTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_lessThanOrEqualTo(maxH);
        }];
    }else{
        CGFloat imgH = 70;
        [self.topicDesImageView sd_setImageWithURL:[NSURL URLWithString:topicModel.content_img_url]];
        [self.topicDesImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(imgH, imgH));
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        // - 计算 cell 行高
        CGFloat maxH = imgH - topH;
        originalHei += maxH;
        [self.topicDetailTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_lessThanOrEqualTo(maxH);
        }];

    }
    topicModel.cellHeight = originalHei;

    // - 标题和内容
    self.topicTitleLabel.text = topicModel.content_title;
    self.topicDetailTitleLabel.text = topicModel.content_summary;
    self.publishTimeLabel.text = topicModel.formatTimeInterval;
    
    // - 发帖人信息
    [self.author_iconImageView sd_setImageWithURL:[NSURL URLWithString:topicModel.content_author_icon_url]];
    self.author_nameLabel.text = topicModel.content_author_name;
    self.categoryLabel.text = topicModel.content_publish_cate;
    
    // - 分类的信息的背景宽度
    int width = MIN([topicModel.content_publish_cate sizeWithAttributes:@{NSFontAttributeName : self.categoryLabel.font}].width + 20, 100);
    width = MAX(width, 40);
    [self.tagImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
    
}

// - MARK: <-- 懒加载 -->
/** 标题的 label */
- (UILabel *)topicTitleLabel{
    if (!_topicTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor colorWithHexString:@"000000"];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _topicTitleLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topicDesImageView);
            make.left.equalTo(self.contentView).offset(10);
        }];
    }
    return _topicTitleLabel;
}

/** 发帖时间的 label */
- (UILabel *)publishTimeLabel{
    if (!_publishTimeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor colorWithHexString:@"666666"];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _publishTimeLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.topicTitleLabel);
            make.left.equalTo(self.topicTitleLabel.mas_right).offset(10);
            make.right.equalTo(self.topicDesImageView.mas_left).offset(-10);
            make.width.mas_greaterThanOrEqualTo(100);
        }];
    }
    return _publishTimeLabel;
}

/** 帖子的详细信息 */
- (UILabel *)topicDetailTitleLabel{
    if (!_topicDetailTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor colorWithHexString:@"666666"];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _topicDetailTitleLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topicTitleLabel);
            make.right.equalTo(self.publishTimeLabel);
            make.top.equalTo(self.topicTitleLabel.mas_bottom).offset(5);
        }];
    }
    return _topicDetailTitleLabel;
}

/** 帖子的图片描述 */
- (UIImageView *)topicDesImageView{
    if (!_topicDesImageView) {
        UIImageView *imgView = [[UIImageView alloc]init];
        [self.contentView addSubview:imgView];
        _topicDesImageView = imgView;
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
    }
    return _topicDesImageView;
}

/** 发布者的头像 */
- (UIImageView *)author_iconImageView{
    if (!_author_iconImageView) {
        UIImageView *imgView = [[UIImageView alloc]init];
        [self.contentView addSubview:imgView];
        _author_iconImageView = imgView;
        CGFloat WH = 20;
        _author_iconImageView.layer.cornerRadius = WH / 2;
        _author_iconImageView.clipsToBounds = YES;
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(WH, WH));
            make.left.equalTo(self.topicTitleLabel);
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    return _author_iconImageView;
}

/** 发布者的昵称 */
- (UILabel *)author_nameLabel{
    if (!_author_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor colorWithHexString:@"666666"];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        _author_nameLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.author_iconImageView);
            make.left.equalTo(self.author_iconImageView.mas_right).offset(10);
            make.width.mas_lessThanOrEqualTo(130);
        }];
    }
    return _author_nameLabel;
}

/** 标签的 icon */
- (UIImageView *)tagImageView{
    if (!_tagImageView) {
        UIImageView *imgView = [[UIImageView alloc]init];
        [self.contentView addSubview:imgView];
        _tagImageView = imgView;
        imgView.image = [UIImage imageNamed:@"category_bg"];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.author_iconImageView);
            make.width.mas_equalTo(90);
            make.left.equalTo(self.author_nameLabel.mas_right).offset(10);
            make.bottom.equalTo(self.author_nameLabel);
        }];
    }
    return _tagImageView;
}

/** 分类的名称 */
- (UILabel *)categoryLabel{
    if (!_categoryLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor colorWithHexString:@"FFFFFF"];
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        [self.tagImageView addSubview:label];
        _categoryLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 10, 5, 5));
        }];
    }
    return _categoryLabel;

}
@end
