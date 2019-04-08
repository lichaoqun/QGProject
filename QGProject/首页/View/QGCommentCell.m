//
//  QGCommentCell.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGCommentCell.h"

@interface QGCommentCell ()

/** 头像 */
@property (nonatomic, weak) UIImageView *avatarImageView;

/** 评论时间 */
@property (nonatomic, weak) UILabel *nickNameLabel;

/** 发布评论的时间 */
@property (nonatomic, weak) UILabel *timeLabel;

/** 评论的内容 */
@property (nonatomic, weak) UILabel *commentLabel;

@end

@implementation QGCommentCell

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
    
    // - 头像
    CGFloat avatarWH = 30;
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:avatarImageView];
    avatarImageView.layer.cornerRadius = avatarWH / 2;
    avatarImageView.clipsToBounds = YES;
    avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView = avatarImageView;
    
    [avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(avatarWH, avatarWH));
        make.left.equalTo(self.contentView).offset(cellLRPadding);
        make.top.equalTo(self.contentView).offset(10);
    }];

    // - 昵称
    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.text = @"";
    nickNameLabel.textColor = [UIColor  colorWithHexString:@"A6A6B4"];
    nickNameLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:nickNameLabel];
    self.nickNameLabel = nickNameLabel;
    
    [nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatarImageView.mas_right).offset(10);
        make.top.equalTo(avatarImageView);
    }];
    
    // - 发布评论的时间
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text =@"";
    timeLabel.textColor = [UIColor colorWithHexString:@"A6A6B4"];
    timeLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickNameLabel);
        make.top.equalTo(nickNameLabel.mas_bottom).offset(10);
    }];
    
    // - 评论内容
    UILabel *commentLabel = [[UILabel alloc] init];
    commentLabel.numberOfLines = 0;
    commentLabel.textColor = [UIColor colorWithHexString:@"333333"];
    commentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:commentLabel];
    self.commentLabel = commentLabel;
    
    [commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickNameLabel);
        make.right.equalTo(self.contentView).offset(-cellLRPadding);
        make.top.equalTo(timeLabel.mas_bottom).offset(10);
    }];
}

// - MARK: <-- 设置 model -->
- (void)setCommentModel:(QGTopicDetailCommentModel *)commentModel{
    _commentModel = commentModel;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:commentModel.commentUserModel.avatar]];
    self.nickNameLabel.text = commentModel.commentUserModel.nickName;
    self.timeLabel.text = [NSString formatTimeWithInterval:commentModel.commentTime];
    self.commentLabel.text = commentModel.commentDetail;
}

@end
