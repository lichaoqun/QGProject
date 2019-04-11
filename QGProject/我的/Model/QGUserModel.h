//
//  QGUserModel.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

@interface QGUserModel : QGModel
 
/** 用户昵称 */
@property(nonatomic, copy)NSString *nickName;

/** 用户头像 */
@property(nonatomic, copy)NSString *avatar;

/** 用户账号 */
@property(nonatomic, copy)NSString *userName;

/** 用户 ID */
@property(nonatomic, copy)NSString *userId;

/** 认证机构 */
@property (nonatomic, copy) NSString *orgName;

/** 认证机构名称 */
@property (nonatomic, copy) NSString *orgName;

@end
