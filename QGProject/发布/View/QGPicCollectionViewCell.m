//
//  QGPicCollectionViewCell.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGPicCollectionViewCell.h"

@interface QGPicCollectionViewCell ()

/** 显示图片的 imageView */
@property(nonatomic, weak)UIImageView *uploadImageView;

/** 删除的按钮 */
@property(nonatomic, weak)UIButton *deleteButton;

@end

@implementation QGPicCollectionViewCell

// - MARK: <-- 重写 setModel -->
- (void)setPicModel:(QGPicModel *)picModel{
    _picModel = picModel;
    self.deleteButton.hidden = !picModel.isuploadPic;
    self.uploadImageView.image = picModel.uploadPic;

}

// - MARK: <-- 懒加载 -->
/** 图片的 imageView */
- (UIImageView *)uploadImageView{
    if (!_uploadImageView) {
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.userInteractionEnabled = YES;
        imgV.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imgV];
        _uploadImageView = imgV;
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.contentView);
        }];
    }
    return _uploadImageView;
}

/** 删除的按钮 */
- (UIButton *)deleteButton{
    if (!_deleteButton) {
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.uploadImageView addSubview:deleteBtn];
        _deleteButton = deleteBtn;
        [deleteBtn setImage:[UIImage imageNamed:@"publish_delete_button"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(onDelegateButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.top.right.equalTo(self.uploadImageView);
        }];
    }
    return _deleteButton;
}

// - MARK: <-- 事件监听 -->
/** 删除按钮 */
-(void)onDelegateButtonClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteModel:)]) {
        [self.delegate deleteModel:self.picModel];
    }
}

@end
