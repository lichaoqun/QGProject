//
//  QGUserCenterCell1.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGUserCenterCell1 : UITableViewCell

/** 用户信息的 Model */
@property(nonatomic, strong)QGUserModel *userModel;

@end

NS_ASSUME_NONNULL_END
