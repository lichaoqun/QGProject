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
    return [self GET:@"content/contentdetails" parameters:@{@"contentId" : topicID} complete:complete];
}

/** 获取帖子的评论信息 */
+(NSURLSessionTask *)getCommentListWithTopicID:(NSString *)topicID page:(int)page complete:(QGResponeComplete)complete{
    return [self GET:@"comment/comments" parameters:@{
                                                        @"contentId" : topicID,
                                                        @"page" : @(page),
                                                        @"size" : @"10"
                                                        } complete:complete];

}

@end
