//
//  QGTopicCategoryView.m
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGTopicCategoryView.h"

@interface QGTopicCategoryView ()

/** 标签的 icon */
@property(nonatomic, weak)UIImageView *tagImageView;

/** 分类的名称 */
@property(nonatomic, weak)UILabel *categoryLabel;

@end

@implementation QGTopicCategoryView

// - MARK: <-- set方法 -->
-(void)setCategory:(NSString *)category{
    _category = category;
    self.categoryLabel.text = category;
    int width = MIN([category sizeWithAttributes:@{NSFontAttributeName : self.categoryLabel.font}].width + 20, 100);
    width = MAX(width, 40);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

// - MARK: <-- 懒加载 -->
/** 标签的 icon */
- (UIImageView *)tagImageView{
    if (!_tagImageView) {
        UIImageView *imgView = [[UIImageView alloc]init];
        [self addSubview:imgView];
        _tagImageView = imgView;
        imgView.image = [UIImage imageNamed:@"category_bg"];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
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
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
    return _categoryLabel;
    
}
@end
