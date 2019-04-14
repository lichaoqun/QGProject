//
//  DYNewsCommentInputView.m
//  QEZB
//
//  Created by qietv on 2017/12/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import "DYNewsCommentInputView.h"

@interface DYNewsCommentInputView ()

@property (weak,nonatomic) UIView *backgroundView;

@property (assign,nonatomic,readwrite) CGSize textViewSize;

@property (weak,nonatomic) UIButton *commendButton;

@end
@implementation DYNewsCommentInputView

@synthesize textViewSize = _textViewSize;
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        [self setBackgroundColor:colorGrayFFFFFF()];
        [self addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:CGSizeMake(6, 6)];
        UIView *backgroundView = [[UIView alloc] init];
        [self addSubview:backgroundView];
        self.backgroundView = backgroundView;
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = colorGrayEFEFEF();
        [self addSubview:lineView];
        
        HWTextView *textView = [[HWTextView alloc] initWithFrame:CGRectZero];
        [textView setBackgroundColor:[UIColor clearColor]];
        textView.placeholder = @"说说你的看法...";
        textView.returnKeyType = UIReturnKeySend;
        textView.placeholderColor = colorGray999999();
        [textView setFont:fontNormal14()];
        [self.backgroundView addSubview:textView];
        self.textView = textView;
        
        UIButton *commendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commendBtn setBackgroundColor:colorRedCD3700()];
        [commendBtn setTitle:@"发表" forState:UIControlStateNormal];
        [commendBtn.titleLabel setFont:fontBold14()];
        [commendBtn setTitleColor:colorGrayFFFFFF() forState:UIControlStateNormal];
        commendBtn.layer.cornerRadius = 30*0.5;
        commendBtn.clipsToBounds = YES;
        [self addSubview:commendBtn];
        self.commendButton = commendBtn;
        [commendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-10);
            make.right.equalTo(self).offset(-15);
            make.width.equalTo(@(60));
            make.height.equalTo(@(30));
        }];
        [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(12.f);
            make.right.equalTo(self.mas_right).with.offset(-12.f);
            make.top.equalTo(self.mas_top).with.offset(11.5f);
            make.bottom.equalTo(self.commendButton.mas_top).with.offset(-7.5f);
        }];
        
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backgroundView.mas_left);
            make.right.equalTo(backgroundView.mas_right);
            make.top.equalTo(backgroundView.mas_top);
            make.bottom.equalTo(backgroundView.mas_bottom);
        }];
        
//        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.top.equalTo(self);
//            make.height.equalTo(@0.5f);
//        }];
    }
    return self;
}

- (void)dealloc{
    
}

- (void)setTextViewPlaceholder:(NSString *)placeholder{
    
}

- (void)setTextViewDelegate:(id<UITextViewDelegate>)delegate{
    self.textView.delegate = delegate;
}

- (BOOL)textViewIsFirstResponder{
    return self.textView.isFirstResponder;
}

- (BOOL)textViewBecomeFirstResponder{
    return [self.textView becomeFirstResponder];
}

- (BOOL)textViewResignFirstResponder{
    return [self.textView resignFirstResponder];
}

- (void)setTextViewSize:(CGSize)textViewSize{
    _textViewSize = textViewSize;
}

- (void)setTextViewWithText:(NSString *)text {
    self.textView.text = text;
}

- (NSString *)textFromTextView {
    return self.textView.text;
}

- (void)setTextViewWithAttribute:(NSAttributedString *)attributeString {
    self.textView.attributedText = attributeString;
}

- (NSAttributedString *)attributeTextFromTextView {
    return self.textView.attributedText;
}

- (NSUInteger)insetLocation {
    return self.textView.selectedRange.location;
}

- (CGSize)textViewSize{
    return _textViewSize;
}

- (void)subBtnAddTarget:(id)obj action:(SEL)action controlEvent:(UIControlEvents)controlEvent {
    [self.commendButton addTarget:obj action:action forControlEvents:controlEvent];
}

@end
