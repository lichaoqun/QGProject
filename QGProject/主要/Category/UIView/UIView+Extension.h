//
//  UIView+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
@end

@interface UIImageView (Extension)

/** 根据URL设置图片 */
- (void)qg_setImageWithURLStr:(nullable NSString *)urlStr NS_REFINED_FOR_SWIFT;

@end

@interface UIButton (Extension)

/** 根据URL设置图片 */
- (void)qg_setImageWithURLStr:(nullable NSString *)urlStr
                  forState:(UIControlState)state NS_REFINED_FOR_SWIFT;
@end
