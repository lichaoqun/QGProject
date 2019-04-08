//
//  QGRequestTool+QGRequestBaseTool.m
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGRequestTool+QGRequestBaseTool.h"

@implementation QGRequestTool (QGRequestBaseTool)

/** get 请求 */
+ (NSURLSessionTask *)GET:(NSString *)URL
               parameters:(id)parameters
                 complete:(QGRequestComplete)complete{
    if ([QGUserManager shareMgr].token)  [PPNetworkHelper setValue:[QGUserManager shareMgr].token forHTTPHeaderField:@"token"];
    return [PPNetworkHelper GET:URL parameters:parameters success:^(id responseObject) {
        QGResponeModel *responeModel = [QGResponeModel yy_modelWithJSON:responseObject];
        if (responeModel.code == 200) [[NSNotificationCenter defaultCenter] postNotificationName:kTokenPast object:nil];
        !complete ? : complete(responeModel);
    } failure:^(NSError *error) {
        QGResponeModel *responeModel = [QGResponeModel failureModel];
        !complete ? : complete(responeModel);
    }];
}

/** post 请求 */
+ (NSURLSessionTask *)POST:(NSString *)URL
                parameters:(id)parameters
                  complete:(QGRequestComplete)complete{
    if ([QGUserManager shareMgr].token)  [PPNetworkHelper setValue:[QGUserManager shareMgr].token forHTTPHeaderField:@"token"];
    return [PPNetworkHelper POST:URL parameters:parameters success:^(id responseObject) {
        QGResponeModel *responeModel = [QGResponeModel yy_modelWithJSON:responseObject];
        if (responeModel.code == 200) [[NSNotificationCenter defaultCenter] postNotificationName:kTokenPast object:nil];
        !complete ? : complete(responeModel);
    } failure:^(NSError *error) {
        QGResponeModel *responeModel = [QGResponeModel failureModel];
        !complete ? : complete(responeModel);
    }];
}

/** 上传图片 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(PPHttpProgress)progress
                                          complete:(QGRequestComplete)complete{
    if ([QGUserManager shareMgr].token)  [PPNetworkHelper setValue:[QGUserManager shareMgr].token forHTTPHeaderField:@"token"];
    return [PPNetworkHelper uploadImagesWithURL:URL parameters:parameters name:name images:images fileNames:fileNames imageScale:(CGFloat)imageScale imageType:imageType progress:progress success:^(id responseObject) {
        QGResponeModel *responeModel = [QGResponeModel yy_modelWithJSON:responseObject];
        if (responeModel.code == 200) [[NSNotificationCenter defaultCenter] postNotificationName:kTokenPast object:nil];
        !complete ? : complete(responeModel);
    } failure:^(NSError *error) {
        QGResponeModel *responeModel = [QGResponeModel failureModel];
        !complete ? : complete(responeModel);
    }];
}

@end
