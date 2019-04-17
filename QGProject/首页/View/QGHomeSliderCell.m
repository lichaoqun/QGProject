//
//  QGHomeSliderCell.m
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeSliderCell.h"
#import <SDCycleScrollView.h>

@interface QGHomeSliderCell () <SDCycleScrollViewDelegate>

/** 无限轮播器 */
@property(nonatomic, weak)SDCycleScrollView *sliderView;

@end

@implementation QGHomeSliderCell

// - MARK: <-- 重写 set 方法 -->
-(void)setSliderModesArray:(NSArray<QGHomeSlierModel *> *)sliderModesArray{
    _sliderModesArray = sliderModesArray;
    NSMutableArray *imageUrls = [NSMutableArray array];
    for (QGHomeSlierModel* model in sliderModesArray) {
        [imageUrls addObject:[requestBaseURL stringByAppendingString:model.sliderUrl]];
    }
    NSArray *titles = [sliderModesArray valueForKeyPath:@"sliderTitle"];
    self.sliderView.imageURLStringsGroup = imageUrls;
    self.sliderView.titlesGroup = titles;
}

// - MARK: <-- 懒加载 -->
- (SDCycleScrollView *)sliderView{
    if (!_sliderView) {
        SDCycleScrollView *sliderView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.width, self.height) delegate:self placeholderImage:nil];
        sliderView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        [self.contentView addSubview:sliderView];
        self.sliderView = sliderView;
    }
    return _sliderView;
}

// - MARK: <-- 代理方法 -->
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    QGHomeSlierModel *sliderModel = self.sliderModesArray[index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectSliderModel:)]) {
        [self.delegate didSelectSliderModel:sliderModel];
    }
}

@end
