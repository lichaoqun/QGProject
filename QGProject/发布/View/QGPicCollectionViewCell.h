//
//  QGPicCollectionViewCell.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGPicModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol QGPicCollectionViewCellDelegate <NSObject>

/** 删除某个 model */
-(void)deleteModel:(QGPicModel *)model;

@end

@interface QGPicCollectionViewCell : UICollectionViewCell

/** 图片的 model */
@property(nonatomic, strong)QGPicModel *picModel;

/** 删除图片的回调 */
@property(nonatomic, weak)id <QGPicCollectionViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
