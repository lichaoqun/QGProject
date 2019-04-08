//
//  QGChangeUserInfoVC.h
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, QGChangeUserInfoType) {
    QGChangeUserINfoTypeUserName = 0,
};

@interface QGChangeUserInfoVC : QGBaseVC

/** 修改的内容 */
@property(nonatomic, assign)QGChangeUserInfoType changeType;

@end

NS_ASSUME_NONNULL_END
