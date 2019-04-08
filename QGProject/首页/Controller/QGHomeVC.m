//
//  QGHomeVC.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGHomeVC.h"
#import "QGArticleVC.h"
#import "QGHomeSliderCell.h"
#import "QGHomeCategoryCell.h"
#import "QGHomeTopicCell.h"
#import "QGHomeModel.h"
#import "QGHomeSlierModel.h"
#import "QGHomeCategoryModel.h"
#import "QGHomeTopicModel.h"
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
//    [PPNetworkHelper GET:nil parameters:nil success:^(id responseObject) {
//
//    } failure:^(NSError *error) {
//
//    }];
    QGHomeModel *model1 = [[QGHomeModel alloc]init];
    model1.data_type = 0;
    model1.data_title = @"轮播图";
    model1.data_content = @[
                       [[QGHomeSlierModel alloc]init],
                       [[QGHomeSlierModel alloc]init],
                       [[QGHomeSlierModel alloc]init],
                       [[QGHomeSlierModel alloc]init],
                       ];
    QGHomeModel *model2 = [[QGHomeModel alloc]init];
    model2.data_type = 1;
    model2.data_title = @"分类";
    model2.data_content = @[
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init],
                        [[QGHomeCategoryModel alloc]init]
                        ];
    [QGPublishChooseCategoryVC setupCategoryModels:model2.data_content];
    QGHomeModel *model3 = [[QGHomeModel alloc]init];
    model3.data_type = 2;
    model3.data_title = @"帖子";
    model3.data_content = @[
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init],
                        [[QGHomeTopicModel alloc]init]
                        ];
    [self.modelsArray addObjectsFromArray:@[model1, model2, model3]];
    [self.tableView reloadData];
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
    if (model.data_type == QGHomeDataTypeSlider) {
        return 1;
    }else if (model.data_type == QGHomeDataTypeCategory){
        return 1;
    }else if (model.data_type == QGHomeDataTypeTopic){
        return model.data_content.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.data_type == QGHomeDataTypeSlider) {
        QGHomeSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:homeSliderCellID forIndexPath:indexPath];
        cell.sliderModesArray = model.data_content;
        cell.delegate = self;
        return cell;
    }else if (model.data_type == QGHomeDataTypeCategory){
        QGHomeCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCategoryCellID forIndexPath:indexPath];
        cell.categoryModelsArray = model.data_content;
        return cell;
    }else if (model.data_type == QGHomeDataTypeTopic){
        QGHomeTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTopicCellID forIndexPath:indexPath];
        cell.topicModel = model.data_content[indexPath.row];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.data_type == QGHomeDataTypeSlider) {
        return 200;
    }else if (model.data_type == QGHomeDataTypeCategory){
        return 160;
    }else if (model.data_type == QGHomeDataTypeTopic){
        return 150;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.data_type == QGHomeDataTypeSlider) {
        return 200;
    }else if (model.data_type == QGHomeDataTypeCategory){
        return 160;
    }else if (model.data_type == QGHomeDataTypeTopic){
        QGHomeTopicModel *topicModel = model.data_content[indexPath.row];
        return topicModel.cellHeight;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QGArticleVC *articleVC = [[QGArticleVC alloc]init];
    [self.navigationController pushViewController:articleVC animated:YES];
}

/** 轮播图图片点击的回调 */
- (void)didSelectSliderModel:(QGHomeSlierModel *)sliderModel{
    NSLog(@"%@", sliderModel.slider_title);
}
@end
