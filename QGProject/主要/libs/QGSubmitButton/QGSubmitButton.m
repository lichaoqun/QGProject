//
//  QGSubmitButton.m
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGSubmitButton.h"

@implementation QGSubmitButton

/** 提交按钮 */
+(instancetype)submitButtonWithTarget:(id)target acion:(SEL)sel{
    QGSubmitButton *sureButton = [QGSubmitButton buttonWithType:UIButtonTypeCustom];
    [sureButton setTitleColor:colorGrayFFFFFF() forState:UIControlStateNormal];
    [sureButton setBackgroundColor:colorRedCD3700()];
    [sureButton addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    sureButton.clipsToBounds = YES;
    sureButton.layer.cornerRadius = 8;
    return sureButton;
}
// - 修改按钮


@end
