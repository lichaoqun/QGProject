//
//  QGRequestTool.h
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QGResponeModel.h"

@interface QGRequestTool : NSObject

/** 首页数据 */
+(NSURLSessionTask *)getHomeDataComplete:(QGResponeComplete)complete;

/** 获取验证码 */
+(NSURLSessionTask *)sendVerificationNumWithPhone:(NSString *)phoneNum complete:(QGResponeComplete)complete;

/** 登录 */
+(NSURLSessionTask *)loginWithPhoneNum:(NSString *)phoneNum verificationCode:(NSString *)verificationCode complete:(QGResponeComplete)complete;

/** 根据 token 获取用户信息 */
+(NSURLSessionTask *)judgeTokenComplete:(QGResponeComplete)complete;

/** 获取帖子的详细信息 */
+(NSURLSession *)getTopicDetailWithTopicID:(NSString *)topicID complete:(QGResponeComplete)complete;

@end
