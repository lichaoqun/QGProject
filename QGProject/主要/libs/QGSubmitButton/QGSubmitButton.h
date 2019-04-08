//
//  QGSubmitButton.h
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QGSubmitButton : UIButton

/** 提交按钮 */
+(instancetype)submitButtonWithTarget:(id)target acion:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
