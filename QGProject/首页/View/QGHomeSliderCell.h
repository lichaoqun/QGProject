//
//  QGHomeSliderCell.h
//  QGProject
//
//  Created by QG on 2019/4/1.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTableViewCell.h"
#import "QGAllHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol QGHomeSliderCellDelegate <NSObject>

/** 选中某个 slider model */
-(void)didSelectSliderModel:(QGHomeSlierModel *)sliderModel;

@end

@interface QGHomeSliderCell : QGTableViewCell

/** 轮播图的数组 */
@property(nonatomic, strong)NSArray <QGHomeSlierModel *> *sliderModesArray;

/** 图片点击的代理 */
@property(nonatomic, weak)id <QGHomeSliderCellDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
