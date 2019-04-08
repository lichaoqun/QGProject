//
//  QGPicModel.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QGPicModel : QGModel

/** 上传的 pic */
@property(nonatomic, strong)UIImage *uploadPic;

/** 判断是不是需要上传的图片 */
@property(nonatomic, assign)BOOL isuploadPic;

/** 提示上传图片的 model */
+(instancetype)defaultModel;

@end

NS_ASSUME_NONNULL_END
