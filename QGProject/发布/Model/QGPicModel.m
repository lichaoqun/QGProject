//
//  QGPicModel.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGPicModel.h"

@implementation QGPicModel

/** 提示上传图片的 model */
+(instancetype)defaultModel{
    QGPicModel *model = [[QGPicModel alloc]init];
    model.isuploadPic = NO;
    model.uploadPic = [UIImage imageNamed:@"publish_upload_pic"];
    return model;
}

@end
