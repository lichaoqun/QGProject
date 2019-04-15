//
//  DYNewsCommentBottomView.h
//  QEZB
//
//  Created by qietv on 2017/12/6.
//  Copyright © 2017年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DYNewsCommentBottomViewDelegate <NSObject>
@optional
- (void)openCommentInput;

@end
@interface DYNewsCommentBottomView : UIView
@property (nonatomic,strong)UIButton *BottomView;
@property (nonatomic,strong)UIImageView *iconImageView;
@property (nonatomic,strong)UILabel *defaultLabel;
@property (nonatomic,strong)UIButton *commetBtn;
@property (nonatomic,strong)UIButton *shareBtn;
@property (nonatomic,strong)UIButton *startCommet;

@property (nonatomic,weak)id <DYNewsCommentBottomViewDelegate>delegate;

@end
