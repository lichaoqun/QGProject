//
//  QGTopicDetailVC.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailVC.h"
#import "QGTopicDetailModel.h"
#import "QGTopicDetailTitleCell.h"
#import "QGTopicDetailTextContentCell.h"
#import "QGTopicDetailImageContentCell.h"
#import "QGCommentCell.h"
#import "QGUserInfoView.h"
#import "DYNewsCommentBottomView.h"
#import "QGCommentHeaderView.h"
#import "QGInputView.h"

static NSString * const kTopicDetailTitleCellID = @"kTopicDetailTitleCellID";
static NSString * const kTopicDetailTextContentCellID = @"kTopicDetailTextContentCellID";
static NSString * const kTopicDetailImageContentCellID = @"kTopicDetailImageContentCellID";
static NSString * const kTopicDetailCommontContentCellID = @"kTopicDetailCommontContentCellID";


@interface QGTopicDetailVC ()<UITableViewDelegate, UITableViewDataSource, DYNewsCommentBottomViewDelegate>

/** 初始化 tableView */
@property (nonatomic, weak) UITableView *tableView;

/** model 数组 */
@property (nonatomic, strong) NSMutableArray *modelArray;

/** 详情的 model */
@property (nonatomic, strong) QGTopicDetailModel *detailModel;

/** 输入框的 view */
@property (nonatomic, weak) QGInputView *inputView;

@end

@implementation QGTopicDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorGrayFFFFFF();
    self.title = self.topicModel.content.contentTitle;
    self.topicModel.contentId = @"10037634";
    [self setupUI];
    [self setupData];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_inputView hiddenInputView];
}

// - MARK: <-- 设置数据和 UI -->
/** 初始化 UI */
-(void)setupUI{
    
    /** 输入框 */
    DYNewsCommentBottomView *bottomView = [[DYNewsCommentBottomView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49)];
    bottomView.delegate = self;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(49);
    }];
    
    // - 初始化tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(bottomView.mas_top);
    }];
    
    // - 注册 cell
    [tableView registerClass:[QGTopicDetailTitleCell class] forCellReuseIdentifier:kTopicDetailTitleCellID];
    [tableView registerClass:[QGTopicDetailTextContentCell class] forCellReuseIdentifier:kTopicDetailTextContentCellID];
    [tableView registerClass:[QGTopicDetailImageContentCell class] forCellReuseIdentifier:kTopicDetailImageContentCellID];
    [tableView registerClass:[QGCommentCell class] forCellReuseIdentifier:kTopicDetailCommontContentCellID];
    
    // - 初始化数组
    self.modelArray = [NSMutableArray array];
}

/** 初始化数据 */
-(void)setupData{
    
    // - 加载帖子详情
    [QGRequestTool getTopicDetailWithTopicID:self.topicModel.contentId complete:^(QGResponeModel *responeModel) {
        if (responeModel.code == 0) {
            QGTopicDetailModel *detailModel = [QGTopicDetailModel yy_modelWithJSON:responeModel.data];
            self.detailModel = detailModel;
            NSMutableArray *section0 = [NSMutableArray array];
            [section0 addObject:detailModel.content];
            [section0 addObjectsFromArray:detailModel.contentLinkSummaries];
            [section0 addObjectsFromArray:detailModel.contentLinkPhotos];
            [self.modelArray addObject:section0];
            [self.modelArray addObject:[NSMutableArray array]];
            
            // - 加载评论
            [self loadComment];
        }else{
            [YJProgressHUD showMessage:responeModel.msg inView:self.view];
        }
    }];
}

/** 加载评论详情页面 */
-(void)loadComment{
    [QGRequestTool getCommentListWithTopicID:self.topicModel.contentId page:1 complete:^(QGResponeModel *responeModel) {
        if (responeModel.code == 0) {
            NSMutableArray *commonList = (NSMutableArray *)[self.modelArray lastObject];
            NSArray *list = [NSArray yy_modelArrayWithClass:[QGTopicDetailCommentContentModel class] json:responeModel.data[@"list"]];
            [commonList addObjectsFromArray:list];
            [self.tableView reloadData];
        }else{
            [YJProgressHUD showMessage:responeModel.msg inView:self.view];
        }
    }];
}

// - MARK: <-- 懒加载 -->
- (QGInputView *)inputView{
    if (!_inputView) {
        QGInputView *inputView = [[QGInputView alloc]initWithFrame:self.navigationController.view.bounds];
        [self.navigationController.view addSubview:inputView];
        _inputView = inputView;
    }
    return _inputView;
}

// - MARK: <-- 代理方法 -->
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *models = self.modelArray[section];
    return models.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        QGUserInfoView *userInfoView = [[QGUserInfoView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
        userInfoView.userModel = self.detailModel.user;
        return userInfoView;
    }else if (section == 1){
        QGCommentHeaderView *commentView = [[QGCommentHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        return commentView;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *models = self.modelArray[indexPath.section];
    QGTopicDetailContentModel *model = models[indexPath.row];
    switch (model.type) {
        case QGTopicModelTypeTitle:{
            QGTopicDetailTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:kTopicDetailTitleCellID forIndexPath:indexPath];
            cell.titleModel = (QGTopicDetailTitleContentModel *)model;
            return cell;
        }
        case QGTopicModelTypeText:{
            QGTopicDetailTextContentCell *cell = [tableView dequeueReusableCellWithIdentifier:kTopicDetailTextContentCellID forIndexPath:indexPath];
            cell.textContentModel = (QGTopicDetailTextContentModel *)model;
            return cell;
        }
        case QGTopicModelTypeImage:{
            QGTopicDetailImageContentCell *cell = [tableView dequeueReusableCellWithIdentifier:kTopicDetailImageContentCellID forIndexPath:indexPath];
            cell.imgContentModel = (QGTopicDetailImageContentModel *)model;
            return cell;
        }
        case QGTopicModelTypeCommont:{
            QGCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kTopicDetailCommontContentCellID forIndexPath:indexPath];
            cell.commentModel = (QGTopicDetailCommentContentModel *)model;
            return cell;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *models = self.modelArray[indexPath.section];
    QGTopicDetailContentModel *model = models[indexPath.row];
    return model.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 70;
    }else if (section == 1){
        return 40;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}

// - 打开输入框
- (void)openCommentInput{
    if ([QGUserManager shareMgr].token) {
        [self.navigationController.view addSubview:self.inputView];
        [self.inputView showInputView];
    }else{
        [QGUserManager showLoginVCComplete:nil];
    }
}

@end
