//
//  QGPublishVC.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGPublishChooseCategoryVC.h"
#import "LMHVerticalButton.h"
#import "QGHomeCategoryModel.h"
#import "QGPublishTopicVC.h"

static CGFloat const animationDelay = 0.1;
static NSArray *modelsArray_;

@interface QGPublishChooseCategoryVC ()

/** 背景的 imageView */
@property(nonatomic, weak)UIImageView *bgImageView;

@end

@implementation QGPublishChooseCategoryVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self animationWeiBo];
}

// - MARK: <-- 设置分类 -->
/** 设置分类的 model */
+(void)setupCategoryModels:(NSArray *)categoryModelsArray{
    modelsArray_ = [NSArray arrayWithArray:categoryModelsArray];
}

// - MARK: <-- 设置 UI 的布局 -->
-(void)setupUI{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imgV.userInteractionEnabled = YES;
    imgV.image = [UIImage imageNamed:@"publish_bg_img"];
    [self.view addSubview:imgV];
    self.bgImageView = imgV;
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"publish_cancel_button"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(btnCancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgImageView addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(289, 40));
        make.centerX.equalTo(self.bgImageView);
        make.bottom.equalTo(self.bgImageView).offset(-(30 + kIndicatorHei));
    }];

}

// - MARK: <-- 动画添加和移除按钮 -->
/** 添加动画 */
- (void)animationWeiBo{
    
    // 1.让控制器的view不能点击
    self.bgImageView.userInteractionEnabled = NO;
    
    // 3.设置中间的按钮 这里是6个 当然也可以是服务器返回的数量 但是计算方法都一样
    int maxCols = 3;  // 一排最多三个
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 38;
    CGFloat btnStartY = (kScreenHeight - 2 * btnH) * 0.4;
    CGFloat btnStartX = 20;
    CGFloat xMargin = (kScreenWidth - 2 * btnStartX - maxCols * btnW) / (maxCols - 1);
    
    [modelsArray_ enumerateObjectsUsingBlock:^(QGHomeCategoryModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 6.计算当前按钮的X/Y
        NSUInteger row = idx / maxCols; //所在行
        NSUInteger col = idx % maxCols; // 所在列
        CGFloat btnX = btnStartX + col * (xMargin + btnW);
        CGFloat btnEndY = btnStartY + row * (btnH + 10);
        CGFloat btnBeginY = kScreenHeight + btnEndY;
        
        // 4.初始化按钮
        LMHVerticalButton * btn = [[LMHVerticalButton alloc]initWithFrame:CGRectMake(btnStartX, btnBeginY, btnW, btnH)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgImageView addSubview:btn];
        btn.btnModel = obj;
        
        // 5. 设置按钮的内容
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn sd_setImageWithURL:[NSURL URLWithString:obj.cate_icon_url] forState:UIControlStateNormal];
        [btn setTitle:obj.cate_name forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 7.给按钮添加弹簧动画
        POPSpringAnimation * anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnBeginY, btnW, btnH)];
        anim.toValue =   [NSValue valueWithCGRect:CGRectMake(btnX, btnEndY, btnW, btnH)];
        anim.springBounciness = 10; //springBounciness为弹簧弹力 取值范围为【0，20】， 默认为4
        anim.springSpeed = 10; //springSpeed为弹簧速度 速度越快 动画时间越短 取值范围[0,20], 默认为12 和springBounciness一起决定弹簧动画效果
        anim.beginTime = CACurrentMediaTime() + animationDelay * idx;  // 开始时间添加延迟
        [btn pop_addAnimation:anim forKey:nil];
        [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            // 动画执行完毕 恢复点击事件
            self.bgImageView.userInteractionEnabled = YES;
        }];
        
    }];
}

/**
 * 先执行退出动画 动画执行完毕再执行completionBlock - 微博
 */
- (void)cancelWithCompletionBlock:(void(^)(void))completionBlock{
    
    // 让控制器的view不能点击
    self.bgImageView.userInteractionEnabled = NO;
    int index = 0; // 索引 用来设置按钮动画的延迟时间
    
    for ( int i = (int)self.bgImageView.subviews.count - 1; i > 0; i--) {
        UIView * subview = self.bgImageView.subviews[i];
        POPBasicAnimation * anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        
        CGFloat centerY = subview.centerY + kScreenHeight;
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(subview.centerX, centerY)];
        anim.beginTime = CACurrentMediaTime() + index * animationDelay;
        index ++;
        
        [subview pop_addAnimation:anim forKey:nil];
        if (i == 1) {
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished){
                if (finished) {
                    [self dismissViewControllerAnimated:NO completion:^{
                        !completionBlock ? : completionBlock();
                    }];
                }
            }];
        }
    }
}


// - MARK: <-- 事件监听 -->
/** 按钮点击事件 */
- (void)btnClick:(LMHVerticalButton *)button{
    [self cancelWithCompletionBlock:^{
        QGHomeCategoryModel *obj = (QGHomeCategoryModel *)button.btnModel;
        QGPublishTopicVC *topicVC = [[QGPublishTopicVC alloc]init];
        topicVC.categoryModel = obj;
        [[QGControllerTool getRootNavVC] pushViewController:topicVC animated:YES];
    }];
}

/** 取消按钮的点击事件 */
- (void)btnCancelClick:(id)sender {
    [self cancelWithCompletionBlock:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self btnCancelClick:nil];
}

@end
