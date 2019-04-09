//
//  QGRequestTool.m
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGRequestTool.h"
#import "QGRequestTool+QGRequestBaseTool.h"

@implementation QGRequestTool
/** 首页数据 */
+(NSURLSessionTask *)getHomeDataComplete:(QGRequestComplete)complete{
    return [self GET:@"http://www.dev.qi-e.tv/app_api/v13/index?aid=ios&carrier=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&cid=197&client_sys=ios&device_id=a8e12b615ff2723beaf5404933e29aa1&device_token=a8e12b615ff2723beaf5404933e29aa1&manufacturer=Apple&model=iPhone10,1&os_version=11.4.1&time=1554795480&vercode=6.1.0.0&version=6.1.0.0&wifi=1&auth=83bbceee18db3530a0af979ed011d82b" parameters:nil complete:complete];
}

/** 登录 */
+(NSURLSessionTask *)loginWithPhoneNum:(NSString *)phoneNum verificationCode:(NSString *)verificationCode complete:(QGRequestComplete)complete{
    return [self POST:@"http://www.dev.qi-e.tv/api/v1/login?aid=ios&carrier=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&client_sys=ios&device_id=a8e12b615ff2723beaf5404933e29aa1&manufacturer=Apple&model=iPhone10,1&os_version=11.4.1&time=1554707400&vercode=6.1.0.0&version=6.1.0.0&wifi=1&auth=e848f5fb8d2012f989f6d492759769c9" parameters:@{
                                                                                                                                                                                                                                                                                                                                            @"is_user_count" : @"1",                                                                                                                                                                                                                                                                                                                @"password": @"96e79218965eb72c92a549dd5a330112",                                                                                                                                                                                                                                                                                                                                            @"type" : @"md5",                                                                                                                                                                                                                                                  @"username" : @"手播11"                                                                                                                                                                                                                                                                  }
             complete:complete];
}

@end
