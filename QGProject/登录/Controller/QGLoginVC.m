//
//  QGLoginVC.m
//  QGProject
//
//  Created by 李超群 on 2019/4/8.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGLoginVC.h"
#import "CountDown.h"

@interface QGLoginVC ()

/** 倒计时 */
@property (nonatomic, strong) CountDown *countMgr;

/** 倒计时的数字 */
@property (nonatomic, assign) int countNum;

/** 登录成功回调的 block */
@property (nonatomic, copy) void(^loginComplete)(QGUserModel *) ;


@end

@implementation QGLoginVC

- (instancetype)initWithLoginComplete:(void(^)(QGUserModel *userModel))complete{
    self = [super init];
    if (self) {
        self.loginComplete = complete;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    [self setupUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.countMgr destoryTimer];
    self.countMgr = nil;
}

-(void)setupUI{
    
    // - 初始变量
    CGFloat viewH = 40;
    
    // - 手机号输入框
    UITextField *phoneNumTF = [[UITextField alloc]initWithFrame:CGRectZero];
    [self.view addSubview:phoneNumTF];
    phoneNumTF.placeholder = @"请输入手机号";
    phoneNumTF.borderStyle = UITextBorderStyleRoundedRect;
    phoneNumTF.returnKeyType = UIReturnKeyDone;
    phoneNumTF.keyboardType = UIKeyboardTypePhonePad;
    phoneNumTF.textColor = [UIColor redColor];
    phoneNumTF.font = [UIFont systemFontOfSize:14];
    
    [phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(viewH);
        make.top.equalTo(self.view).offset(200);
    }];
    
    // - 验证码输入框
    UITextField *verificationNumTF = [[UITextField alloc]initWithFrame:CGRectZero];
    [self.view addSubview:verificationNumTF];
    verificationNumTF.placeholder = @"请输入验证码";
    verificationNumTF.borderStyle = UITextBorderStyleRoundedRect;
    verificationNumTF.returnKeyType = UIReturnKeyDone;
    verificationNumTF.keyboardType = UIKeyboardTypePhonePad;
    verificationNumTF.textColor = [UIColor redColor];
    verificationNumTF.font = [UIFont systemFontOfSize:14];
    
    [verificationNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(phoneNumTF);
        make.top.equalTo(phoneNumTF.mas_bottom).offset(10);
        make.height.equalTo(phoneNumTF);
    }];
    
    // - 获取验证码输入框
    UIButton *sendVerificationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendVerificationBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    sendVerificationBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [sendVerificationBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [sendVerificationBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateDisabled];
    sendVerificationBtn.frame = CGRectMake(0, 0, viewH *2, viewH);
    verificationNumTF.rightView = sendVerificationBtn;
    verificationNumTF.rightViewMode = UITextFieldViewModeAlways;
    [sendVerificationBtn addTarget:self action:@selector(onSendButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    // - 登录按钮
    QGSubmitButton *loginBtn = [QGSubmitButton submitButtonWithTarget:self acion:@selector(onLoginButtonClick)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    [loginBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(200, 44));
        make.bottom.equalTo(self.view).offset(-200);
        make.centerX.equalTo(self.view);
    }];
}

// - MARK: <-- 懒加载 -->
/** 倒计时工具 */
-(CountDown *)countMgr{
    if(!_countMgr){
        _countMgr = [[CountDown alloc] init];
    }
    return _countMgr;
}


// - MARK: <-- 按钮的事件监听 -->
/** 发送验证码 */
-(void)onSendButtonClick:(UIButton *)sender{
    sender.enabled = NO;
    self.countNum = 60;
    [self.countMgr countDownWithPER_SECBlock:^{
        self.countNum -- ;
        if (self.countNum == 0) {
            [self.countMgr destoryTimer];
            self.countMgr = nil;
            sender.enabled = YES;
        }else{
            NSString *countNumStr = [NSString  stringWithFormat:@"%d秒后重发", self.countNum];
            [sender setTitle:countNumStr forState:UIControlStateDisabled];
        }
    }];
}

/** 登录按钮 */
-(void)onLoginButtonClick{
    [QGRequestTool loginWithPhoneNum:nil verificationCode:nil complete:^(QGResponeModel *responeModel) {
        if (responeModel.code == 0) {
            QGUserModel *model = [QGUserModel yy_modelWithJSON:responeModel.data];
            [QGUserManager shareMgr].userModel = model;
            !self.loginComplete ? : self.loginComplete(model);
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }else{
            [YJProgressHUD showMessage:responeModel.msg inView:self.view];
        }
    }];
}

@end
