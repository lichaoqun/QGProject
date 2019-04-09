//
//  QGHomeCategoryCell.m
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeCategoryCell.h"
#import "JHHorizontalPageFlowlayout.h"

static NSString *categoryCollectionViewCellID = @"categoryCollectionViewCellID";

int const itemCountPerRow = 5;

@interface QGCategoryCollectionCell : UICollectionViewCell

/** 标题 */
@property(nonatomic, weak)UILabel *categoryTitleLabel;

/** 图片 */
@property(nonatomic, weak)UIImageView *categoryImageView;

/** 分类的 model */
@property(nonatomic, strong)QGHomeCategoryModel *categoryModel;

@end

@implementation QGCategoryCollectionCell

/** 标题 */
- (UILabel *)categoryTitleLabel{
    if(!_categoryTitleLabel){
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor colorWithHexString:@"666666"];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        self.categoryTitleLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-5);
        }];
    }
    return _categoryTitleLabel;
}

/** 图片 */
- (UIImageView *)categoryImageView{
    if (!_categoryImageView) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:imgView];
        self.categoryImageView = imgView;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView).offset(-10);
        }];
    }
    return _categoryImageView;
}

-(void)setCategoryModel:(QGHomeCategoryModel *)categoryModel{
    _categoryModel = categoryModel;
    self.categoryTitleLabel.text = categoryModel.cateName;
    [self.categoryImageView sd_setImageWithURL:[NSURL URLWithString:categoryModel.cateIconUrl]];
}

@end

@interface QGHomeCategoryCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

/** 分类的collectionView */
@property(nonatomic, weak)UICollectionView *categoryCollectionView;

@end


@implementation QGHomeCategoryCell

// - MARK: <-- 懒加载 -->
-(UICollectionView *)categoryCollectionView{
    if (!_categoryCollectionView) {
        NSInteger maxCount = MIN(2, ((self.categoryModelsArray.count + (itemCountPerRow - 1)) / itemCountPerRow));
        JHHorizontalPageFlowlayout *layout = [[JHHorizontalPageFlowlayout alloc] initWithRowCount:maxCount itemCountPerRow:itemCountPerRow];
        [layout setColumnSpacing:5 rowSpacing:5 edgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.pagingEnabled = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:collectionView];
        _categoryCollectionView = collectionView;
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
        }];
        [collectionView registerClass:[QGCategoryCollectionCell class] forCellWithReuseIdentifier:categoryCollectionViewCellID];
    }
    return _categoryCollectionView;
}

// - MARK: <-- 重写 set 方法 -->
-(void)setCategoryModelsArray:(NSArray<QGHomeCategoryModel *> *)categoryModelsArray{
    _categoryModelsArray = categoryModelsArray;
    [self.categoryCollectionView reloadData];
}

// - MARK: <-- 代理方法 -->
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QGCategoryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:categoryCollectionViewCellID forIndexPath:indexPath];
    cell.categoryModel = self.categoryModelsArray[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categoryModelsArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"sadfsafasf");
}

@end
