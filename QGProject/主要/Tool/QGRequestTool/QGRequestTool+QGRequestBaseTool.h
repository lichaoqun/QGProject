//
//  QGRequestTool+QGRequestBaseTool.h
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGRequestTool.h"
#import "QGResponeModel.h"

@interface QGRequestTool (QGRequestBaseTool)

/** get 请求 */
+ (NSURLSessionTask *)GET:(NSString *)URL
               parameters:(id)parameters
                   complete:(QGResponeComplete)complete;
/** post 请求 */
+ (NSURLSessionTask *)POST:(NSString *)URL
                parameters:(id)parameters
                  complete:(QGResponeComplete)complete;

/** 上传图片 */
+ (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(PPHttpProgress)progress
                                          complete:(QGResponeComplete)complete;

@end
