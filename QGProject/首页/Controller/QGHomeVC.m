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
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init],
                        [[QGHomeCategoryCell alloc]init]
                        ];
    QGHomeModel *model3 = [[QGHomeModel alloc]init];
    model3.data_type = 2;
    model3.data_title = @"帖子";
    model3.data_content = @[
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init],
                        [[QGHomeTopicCell alloc]init]
                        ];
    [self.modelsArray addObjectsFromArray:@[model1, model2, model3]];
    [self.tableView reloadData];
}

// - MARK: <-- 懒加载 -->
/** 首页的 tableView */
-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
        
        [tableView registerClass:[QGHomeSliderCell class] forCellReuseIdentifier:homeSliderCellID];
        [tableView registerClass:[QGHomeCategoryCell class] forCellReuseIdentifier:homeCategoryCellID];
        [tableView registerClass:[QGHomeTopicCell class] forCellReuseIdentifier:homeTopicCellID];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self.view);
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
        return cell;
    }else if (model.data_type == QGHomeDataTypeTopic){
        QGHomeTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTopicCellID forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeModel *model = self.modelsArray[indexPath.section];
    if (model.data_type == QGHomeDataTypeSlider) {
        return 200;
    }else if (model.data_type == QGHomeDataTypeCategory){
        return 140;
    }else if (model.data_type == QGHomeDataTypeTopic){
        return 80;
    }
    return 0;
}

/** 轮播图图片点击的回调 */
- (void)didSelectSliderModel:(QGHomeSlierModel *)sliderModel{
    NSLog(@"%@", sliderModel.slider_title);
}
@end
