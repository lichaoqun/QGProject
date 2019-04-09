//
//  QGChangeUserInfoVC.m
//  QGProject
//
//  Created by QG on 2019/4/6.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGChangeUserInfoVC.h"
#import "HWTextView.h"

@interface QGChangeUserInfoVC ()<UITextViewDelegate>

/** 设置 titleTV */
@property(nonatomic, weak)HWTextView *titleTV;


@end

@implementation QGChangeUserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorGrayFFFFFF();
    [self setupUI];
    
    // - token 过期的处理
    [self addTokenPassNoti];
}

// - MARK: <-- 设置 UI -->
-(void)setupUI{
    // - 标题的输入框
    HWTextView *titleTV = [[HWTextView alloc]initWithFrame:CGRectZero];
    titleTV.font = fontNormal18();
    titleTV.backgroundColor = colorGrayF5F5F5();
    [self.view addSubview:titleTV];
    self.titleTV = titleTV;
    titleTV.delegate = self;
    titleTV.returnKeyType = UIReturnKeyDone;
    [titleTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(80);
        make.top.equalTo(self.view).offset(kNavigatonBarHei + 40);
    }];
    
    // - 修改按钮
    QGSubmitButton *sureButton = [QGSubmitButton submitButtonWithTarget:self acion:@selector(onSureButtonClick)];
    [sureButton setTitle:@"修改" forState:UIControlStateNormal];
    [self.view addSubview:sureButton];
    
    [sureButton  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(200, 44));
        make.bottom.equalTo(self.view).offset(-200);
        make.centerX.equalTo(self.view);
    }];
    
    // - 根据不同的 type 设置不同的 placehodler
    switch (self.changeType) {
        case QGChangeUserINfoTypeUserName:{
            self.titleTV.placeholder = @"请输入新昵称~";
            self.title = @"修改昵称";
            break;
        }
        default:
            break;
    }
}

// - MARK: <-- 按钮监听 -->
-(void)onSureButtonClick{
    [self.view endEditing:YES];
    if(self.titleTV.text.length){
        // - 修改昵称
    }else{
        [YJProgressHUD showMessage:@"请输入有效的昵称" inView:self.view];
        
    }
}

// - MARK: <-- 代理 -->
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
