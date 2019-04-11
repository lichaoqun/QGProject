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
+(NSURLSessionTask *)getHomeDataComplete:(QGResponeComplete)complete{
    return [self GET:@"homepage/homepage" parameters:nil complete:complete];
}

/** 获取验证码 */
+(NSURLSessionTask *)sendVerificationNumWithPhone:(NSString *)phoneNum complete:(QGResponeComplete)complete{
    return [self POST:@"user/sendtextmessage" parameters:@{@"phone" : phoneNum} complete:complete];
}

/** 登录 */
+(NSURLSessionTask *)loginWithPhoneNum:(NSString *)phoneNum verificationCode:(NSString *)verificationCode complete:(QGResponeComplete)complete{
    return [self POST:@"user/login" parameters:@{@"userName": phoneNum,
                                                 @"verification" : verificationCode
                                                 }
             complete:complete];
}

/** 根据 token 获取用户信息 */
+(NSURLSessionTask *)judgeTokenComplete:(QGResponeComplete)complete{
    return [self GET:@"user/judgetoken" parameters:nil complete:complete];
}

/** 获取帖子的详细信息 */
+(NSURLSessionTask *)getTopicDetailWithTopicID:(NSString *)topicID complete:(QGResponeComplete)complete{
    return [self GET:@"http://www.dev.qi-e.tv/qie_news/qie_news/news_detail?aid=ios&carrier=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&client_sys=ios&device_id=a8e12b615ff2723beaf5404933e29aa1&manufacturer=Apple&model=iPhone10,1&os_version=11.4.1&time=1554776280&vercode=6.1.0.0&version=6.1.0.0&wifi=1&auth=f14697bf1c7f2f6c02c73801ce48e2ff" parameters:nil complete:complete];
}

@end
