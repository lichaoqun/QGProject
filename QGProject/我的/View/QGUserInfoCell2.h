//
//  QGUserInfoCell2.h
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QGUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGUserInfoCell2 : UITableViewCell

/** 主标题 */
@property(nonatomic, weak)UILabel *mainTitleLabel;

/** 用户信息的 label */
@property(nonatomic, weak)UILabel *subTitleLabel;

@end

NS_ASSUME_NONNULL_END
