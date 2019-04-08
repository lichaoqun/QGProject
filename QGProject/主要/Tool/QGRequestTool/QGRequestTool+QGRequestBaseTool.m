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
    return [PPNetworkHelper GET:URL parameters:parameters success:^(id responseObject) {
        QGResponeModel *requestModel = [QGResponeModel yy_modelWithJSON:responseObject];
        !complete ? : complete(requestModel);
    } failure:^(NSError *error) {
        QGResponeModel *requestModel = [QGResponeModel failureModel];
        !complete ? : complete(requestModel);
    }];
}

/** post 请求 */
+ (NSURLSessionTask *)POST:(NSString *)URL
                parameters:(id)parameters
                  complete:(QGRequestComplete)complete{
    return [PPNetworkHelper POST:URL parameters:parameters success:^(id responseObject) {
        QGResponeModel *requestModel = [QGResponeModel yy_modelWithJSON:responseObject];
        !complete ? : complete(requestModel);
    } failure:^(NSError *error) {
        QGResponeModel *requestModel = [QGResponeModel failureModel];
        !complete ? : complete(requestModel);
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
    return [PPNetworkHelper uploadImagesWithURL:URL parameters:parameters name:name images:images fileNames:fileNames imageScale:(CGFloat)imageScale imageType:imageType progress:progress success:^(id responseObject) {
        QGResponeModel *requestModel = [QGResponeModel yy_modelWithJSON:responseObject];
        !complete ? : complete(requestModel);
    } failure:^(NSError *error) {
        QGResponeModel *requestModel = [QGResponeModel failureModel];
        !complete ? : complete(requestModel);
    }];
}

@end
