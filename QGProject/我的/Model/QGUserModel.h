//
//  QGUserModel.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGUserModel : QGModel
 
/** 用户名 */
@property(nonatomic, copy)NSString *userName;

/** 用户头像 */
@property(nonatomic, copy)NSString *userIcon;

/** 用户手机号 */
@property(nonatomic, copy)NSString *userPhoneNum;

/** 用户 ID */
@property(nonatomic, copy)NSString *userId;

/** 用户的token */
@property(nonatomic, copy)NSString *token;

@end

NS_ASSUME_NONNULL_END
