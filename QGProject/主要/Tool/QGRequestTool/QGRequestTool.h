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

/** 登录 */
+(NSURLSessionTask *)getHomeDataComplete:(QGRequestComplete)complete;

/** 登录 */
+(NSURLSessionTask *)loginWithPhoneNum:(NSString *)phoneNum verificationCode:(NSString *)verificationCode complete:(QGRequestComplete)complete;

@end
