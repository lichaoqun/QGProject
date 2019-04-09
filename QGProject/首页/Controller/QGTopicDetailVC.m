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

static NSString * const kTopicDetailTitleCellID = @"kTopicDetailTitleCellID";
static NSString * const kTopicDetailTextContentCellID = @"kTopicDetailTextContentCellID";
static NSString * const kTopicDetailImageContentCellID = @"kTopicDetailImageContentCellID";

@interface QGTopicDetailVC ()<UITableViewDelegate, UITableViewDataSource>

/** 初始化 tableView */
@property (nonatomic, weak) UITableView *tableView;

/** model 数组 */
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation QGTopicDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorGrayFFFFFF();
    
    [self setupUI];
    [self setupData];
}

// - MARK: <-- 设置数据和 UI -->
/** 初始化 UI */
-(void)setupUI{
    
    // - 初始化tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    // - 注册 cell
    [tableView registerClass:[QGTopicDetailTitleCell class] forCellReuseIdentifier:kTopicDetailTitleCellID];
    [tableView registerClass:[QGTopicDetailTextContentCell class] forCellReuseIdentifier:kTopicDetailTextContentCellID];
    [tableView registerClass:[QGTopicDetailImageContentCell class] forCellReuseIdentifier:kTopicDetailImageContentCellID];
    
    // - 初始化数组
    self.modelArray = [NSMutableArray array];
}

/** 初始化数据 */
-(void)setupData{
    [QGRequestTool getTopicDetailWithTopicID:nil complete:^(QGResponeModel *responeModel) {
        if (responeModel.code == 0) {
            QGTopicDetailModel *detailModel = [QGTopicDetailModel yy_modelWithJSON:responeModel.data];
            
            // - 标题
            QGTopicDetailTitleContentModel *titleModel = detailModel.topicTitle;
            NSArray *titleModelArray = [NSArray arrayWithObject:titleModel];
            [self.modelArray addObject:titleModelArray];
            
            // - 内容
            NSMutableArray *contentArray = [NSMutableArray array];
            for (NSDictionary *dic in detailModel.content) {
                QGTopicDetailContentModel *contentModel = [QGTopicDetailContentModel yy_modelWithJSON:dic];
                switch (contentModel.type) {
                    case QGTopicModelTypeText:{
                        QGTopicDetailTextContentModel *model = [QGTopicDetailTextContentModel yy_modelWithJSON:dic];
                        [contentArray addObject:model];
                        break;
                    }
                    case QGTopicModelTypeImage:{
                        QGTopicDetailImageContentModel *model = [QGTopicDetailImageContentModel yy_modelWithJSON:dic];
                        [contentArray addObject:model];
                        break;
                    }
                    default:
                        break;
                }
            }
            [self.modelArray addObject:contentArray];
            [self.tableView reloadData];
        }else{
            [YJProgressHUD showMessage:responeModel.msg inView:self.view];
        }
    }];
}

// - MARK: <-- 代理方法 -->
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *models = self.modelArray[section];
    return models.count;
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
            
        default:
            return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
    NSArray *models = self.modelArray[indexPath.section];
    QGTopicDetailContentModel *model = models[indexPath.row];
    return model.cellHeight;
}

@end
