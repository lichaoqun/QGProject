//
//  QGInputView.m
//  QGProject
//
//  Created by 李超群 on 2019/4/14.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGInputView.h"
#import "DYNewsCommentInputView.h"

@interface QGInputView ()

/** 输入的 view */
@property (nonatomic, weak) DYNewsCommentInputView *inputView;

@end

@implementation QGInputView

static CGFloat const viewH = 138;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    self.backgroundColor = [colorGray333333() colorWithAlphaComponent:0.5];
    
    // - 评论的输入框
    DYNewsCommentInputView *inputView = [[DYNewsCommentInputView alloc] initWithFrame:CGRectMake(0, kScreenHeight -138, kScreenWidth, 138)];
    [self addSubview:inputView];
    [inputView setTextViewDelegate:self];
    [inputView subBtnAddTarget:self action:@selector(commentBarAction:) controlEvent:UIControlEventTouchUpInside];
    self.inputView = inputView;
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(viewH);
        make.top.equalTo(self.mas_bottom);
    }];
    
    // - 键盘监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeHei:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)changeHei:(NSNotification *)noti{
    CGSize keyboardSize = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [self.inputView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-(viewH + keyboardSize.height));
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];

}

/** 显示输入的 view */
-(void)showInputView{
    self.hidden = NO;
    [self.inputView textViewBecomeFirstResponder];
}

/** 隐藏输入的 view */
-(void)hiddenInputView{
    [self endEditing:YES];
    [self.inputView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hiddenInputView];
}

@end
