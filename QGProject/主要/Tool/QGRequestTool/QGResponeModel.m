//
//  QGResponeModel.m
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGResponeModel.h"

@implementation QGResponeModel

/** 请求失败的 model */
+(instancetype)failureModel{
    QGResponeModel *failureModel = [[QGResponeModel alloc]init];
    failureModel.code = -112233;
    failureModel.msg = @"";
    failureModel.data = nil;
    return failureModel;
}

/** 判断是不是网络错误的请求 */
- (BOOL)failureReq{
    return self.code == -112233;
}
@end
