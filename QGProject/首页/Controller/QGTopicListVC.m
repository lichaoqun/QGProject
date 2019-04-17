//
//  QGTopicListVC.m
//  QGProject
//
//  Created by QG on 2019/4/17.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicListVC.h"
#import "QGHomeTopicCell.h"

static NSString * const homeTopicCellID = @"homeTopicCellID";

@interface QGTopicListVC () <UITableViewDelegate, UITableViewDataSource>

/** tableView */
@property(nonatomic, weak)UITableView *topicListTableView;

/** model数组 */
@property(nonatomic, strong)NSMutableArray *modelsArray;

@end

@implementation QGTopicListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}
-(void)setupData{
    
}

// - MARK: <-- 懒加载 -->
-(UITableView *)topicListTableView{
    if (!_topicListTableView) {
        UITableView *topicListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        topicListTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:topicListTableView];
        topicListTableView.delegate = self;
        topicListTableView.dataSource = self;
        _topicListTableView = topicListTableView;
        
        [topicListTableView registerClass:[QGHomeTopicCell class] forCellReuseIdentifier:homeTopicCellID];
        [topicListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            
            if (@available(iOS 11.0, *)) {
                topicListTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            make.bottom.equalTo(self.view).offset(kTabbarHei);

        }];
    }
    return _topicListTableView;
}

/** models 数组 */
- (NSMutableArray *)modelsArray{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}

// - MARK: <-- 代理方法 -->
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeTopicModel *model = self.modelsArray[indexPath.row];
    QGHomeTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:homeTopicCellID forIndexPath:indexPath];
    cell.topicModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QGHomeTopicModel *model = self.modelsArray[indexPath.row];
    return model.cellHeight;
}

@end
