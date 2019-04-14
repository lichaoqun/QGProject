//
//  DYNewsCommentInputView.h
//  QEZB
//
//  Created by qietv on 2017/12/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWTextView.h"

@interface DYNewsCommentInputView : UIView
@property (weak,nonatomic) HWTextView *textView;
@property (weak,nonatomic) UILabel               *textNumLabel;
@property (weak,nonatomic) UILabel               *totalNumLabel;

- (void)setTextViewDelegate:(id<UITextViewDelegate>)delegate;

- (BOOL)textViewIsFirstResponder;

- (BOOL)textViewResignFirstResponder;

- (BOOL)textViewBecomeFirstResponder;

- (void)setTextViewSize:(CGSize)textViewSize;

- (CGSize)textViewSize;

- (void)setTextViewWithText:(NSString *)text;

- (NSString *)textFromTextView;

- (void)setTextViewWithAttribute:(NSAttributedString *)attributeString;

- (NSAttributedString *)attributeTextFromTextView;

- (NSUInteger)insetLocation;
- (void)subBtnAddTarget:(id)obj action:(SEL)action controlEvent:(UIControlEvents)controlEvent;

@end
