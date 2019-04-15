//
//  QGHomeVC.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeVC.h"
#import "QGTopicDetailVC.h"
#import "QGHomeSliderCell.h"
#import "QGHomeCategoryCell.h"
#import "QGHomeTopicCell.h"
#import "QGHomeModel.h"
#import "QGAllHomeModel.h"
#import "QGPublishChooseCategoryVC.h"

static NSString * const homeSliderCellID = @"homeSliderCellID";
static NSString * const homeCategoryCellID = @"homeCategoryCellID";
static NSString * const homeTopicCellID = @"homeTopicCellID";

@interface QGHomeVC () <UITableViewDelegate, UITableViewDataSource, QGHomeSliderCellDelegate>

/** tableView */
@property(nonatomic, weak)UITableView *tableView;

/** model数组 */
@property(nonatomic, strong)NSMutableArray *modelsArray;

@end

@implementation QGHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}

// - MARK: <-- 网络请求 -->
/** 请求数据 */
-(void)setupData{
    [QGRequestTool getHomeDataComplete:^(QGResponeModel *responeModel) {
        if (responeModel.code == 0) {
            NSArray *dataArray = (NSArray *)responeModel.data;
            for (NSDictionary *dic in dataArray) {
                QGHomeModel *homeModel = [QGHomeModel yy_modelWithJSON:dic];
                switch (homeModel.dataType) {
                    case QGHomeDataTypeSlider:{
                        NSArray *contentArray = [NSArray yy_modelArrayWithClass:[QGHomeSlierModel class] json:homeModel.dataContent];
                        homeModel.dataContent = contentArray;
                        break;
                    }
                    case QGHomeDataTypeCategory:{
                        NSArray *contentArray = [NSArray yy_modelArrayWithClass:[QGHomeCategoryModel class] json:homeModel.dataContent];
                        homeModel.dataContent = contentArray;
                        [QGPublishChooseCategoryVC setupCategoryModels:homeModel.dataContent];
                        break;
                    }
                    case QGHomeDataTypeTopic:{
                        NSArray *contentArray = [NSArray yy_modelArrayWithClass:[QGHomeTopicModel class] json:homeModel.dataContent];
                        homeModel.dataContent = contentArray;
                        break;
                    }
                    default:
                        break;
                }
                [self.modelsArray addObject:homeModel];
            }
            [self.tableView reloadData];
        }else{
            [YJProgressHUD showMessage:responeModel.msg inView:self.view];
        }
    }];
}

// - MARK: <-- 懒加载 -->
/** 首页的 tableView */
-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
        
        [tableView registerClass:[QGHomeSliderCell class] forCellReuseIdentifier:homeSliderCellID];
        [tableView registerClass:[QGHomeCategoryCell class] forCellReuseIdentifier:homeCategoryCellID];
        [tableView registerClass:[QGHomeTopicCell class] forCellReuseIdentifier:homeTopicCellID];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            
            if (@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
                
            }else{
                make.bottom.equalTo(self.view).offset(-49);
            }
        }];
    }
    return _tableView;
}

/** models 数组 */
- (NSMutableArray *)modelsArray{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}

// - MARK: <-- 代理方法 -->
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    QGHomeModel *model = self.modelsArray[section];
    if (model.dataType == QGHomeDataTypeSlider) {
        return 1;
    }else if (model.dataType == QGHomeDataTypeCategory){
        return 1;
    }else if (model.dataType == QGHomeDataTypeTopic){
        return model.dataContent.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.dataType == QGHomeDataTypeSlider) {
        QGHomeSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:homeSliderCellID forIndexPath:indexPath];
        cell.sliderModesArray = (NSArray<QGHomeSlierModel *> * )model.dataContent;
        cell.delegate = self;
        return cell;
    }else if (model.dataType == QGHomeDataTypeCategory){
        QGHomeCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCategoryCellID forIndexPath:indexPath];
        cell.categoryModelsArray = (NSArray<QGHomeCategoryModel *> *)model.dataContent;
        return cell;
    }else if (model.dataType == QGHomeDataTypeTopic){
        QGHomeTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTopicCellID forIndexPath:indexPath];
        cell.topicModel = (QGHomeTopicModel *)model.dataContent[indexPath.row];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.dataType == QGHomeDataTypeSlider) {
        return 200;
    }else if (model.dataType == QGHomeDataTypeCategory){
        return 160;
    }else if (model.dataType == QGHomeDataTypeTopic){
        return 150;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.dataType == QGHomeDataTypeSlider) {
        return 200;
    }else if (model.dataType == QGHomeDataTypeCategory){
        NSArray *categoryModelsArray = (NSArray<QGHomeCategoryModel *> *)model.dataContent;
        NSInteger maxCount = MIN(2, ((categoryModelsArray.count + (itemCountPerRow - 1)) / itemCountPerRow));
        return maxCount * 80;
    }else if (model.dataType == QGHomeDataTypeTopic){
        QGHomeTopicModel *topicModel = (QGHomeTopicModel *)model.dataContent[indexPath.row];
        return topicModel.cellHeight;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.dataType == QGHomeDataTypeTopic) {
        QGHomeTopicModel *topicModel = (QGHomeTopicModel *)model.dataContent[indexPath.row];
        QGTopicDetailVC *detailVC = [[QGTopicDetailVC alloc]init];
        detailVC.topicModel = topicModel;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

/** 轮播图图片点击的回调 */
- (void)didSelectSliderModel:(QGHomeSlierModel *)sliderModel{
    NSLog(@"%@", sliderModel.sliderTitle);
}
@end
