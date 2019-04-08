//
//  QGResponeModel.h
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QGResponeModel;

/** 请求完成的Block */
typedef void(^QGRequestComplete)(QGResponeModel *responeModel);

@interface QGResponeModel : NSObject

/** 错误信息 */
@property (nonatomic, copy) NSString *msg;

/** 返回错误码 */
@property (nonatomic, assign) int code;

/** 返回值 */
@property (nonatomic, strong) id data;

/** 判断是不是网络错误的请求 */
@property (nonatomic, assign, readonly) BOOL failureReq;

/** 请求失败的 model */
+(instancetype)failureModel;


@end
