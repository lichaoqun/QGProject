//
//  QGPublishTopicVC.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGPublishTopicVC.h"
#import "QGPicCollectionViewCell.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import "HWTextView.h"

static NSString *picCollectionViewCellID = @"picCollectionViewCellID";

@interface QGPublishTopicVC ()<UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, QGPicCollectionViewCellDelegate>

/** 图片模型数组 */
@property(nonatomic, strong)NSMutableArray *picModelsArray;

/** 图片展示的 view */
@property(nonatomic, weak)UICollectionView *picCollectonView;

@end

@implementation QGPublishTopicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.categoryModel.cate_name;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    self.fd_prefersNavigationBarHidden = YES;
}

// - MARK: <-- 初始化 UI -->
-(void)setupUI{
    
    // - 展示图片的view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(120, 180);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *picCollectonView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    picCollectonView.pagingEnabled = NO;
    picCollectonView.backgroundColor = [UIColor clearColor];
    picCollectonView.delegate = self;
    picCollectonView.dataSource = self;
    picCollectonView.showsHorizontalScrollIndicator = NO;
    picCollectonView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:picCollectonView];
    _picCollectonView = picCollectonView;
    [picCollectonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(180);
        make.bottom.equalTo(self.view).offset(-kIndicatorHei);
    }];
    [picCollectonView registerClass:[QGPicCollectionViewCell class] forCellWithReuseIdentifier:picCollectionViewCellID];
    
    // - 标题的输入框
    HWTextView *titleTV = [[HWTextView alloc]initWithFrame:CGRectZero];
    titleTV.placeholder = @"请输入标题~";
    titleTV.font = [UIFont systemFontOfSize:18];
    titleTV.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    [self.view addSubview:titleTV];
    titleTV.delegate = self;
    titleTV.returnKeyType = UIReturnKeyDone;
    [titleTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(80);
        make.top.equalTo(self.view).offset(kNavigatonBarHei);
    }];
    
    // - 内容的输入框
    HWTextView *summerTV = [[HWTextView alloc]initWithFrame:CGRectZero];
    summerTV.placeholder = @"请输入内容~";
    summerTV.font = [UIFont systemFontOfSize:18];
    summerTV.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    summerTV.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:summerTV];
    summerTV.delegate = self;
    [summerTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(titleTV);
        make.top.equalTo(titleTV.mas_bottom).offset(20);
        make.bottom.equalTo(picCollectonView.mas_top).offset(-20);
    }];
    
    // - 发布按钮
    UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [publishBtn setTitleColor:[UIColor colorWithHexString:@"CD3700"] forState:UIControlStateNormal];
    [publishBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:publishBtn];
    [publishBtn addTarget:self action:@selector(onPublishButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(titleTV.mas_top).offset(-10);
    }];
    
    // - 取消按钮
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    [cancel.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:cancel];
    [cancel addTarget:self action:@selector(onCancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(titleTV.mas_top).offset(-10);
    }];
}

/** 更新选中的图片 */
-(void)reloadCollectionView{
    QGPicModel *pModel = [self.picModelsArray lastObject];
    if ((self.picModelsArray.count < 9) && pModel.isuploadPic)[self.picModelsArray addObject:[QGPicModel defaultModel]];
    [self.picCollectonView reloadData];
}

// - MARK: <-- 懒加载 -->
- (NSMutableArray *)picModelsArray{
    if (!_picModelsArray) {
        _picModelsArray = [NSMutableArray array];
        [_picModelsArray addObject:[QGPicModel defaultModel]];
    }
    return _picModelsArray;
}

// - MARK: <-- 事件监听 -->
- (void)onPublishButtonClick{
    [self.view endEditing:YES];
}
-(void)onCancelButtonClick{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
// - MARK: <-- 代理方法 -->
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QGPicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:picCollectionViewCellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.picModel = self.picModelsArray[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picModelsArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    QGPicModel *picModel = self.picModelsArray[indexPath.row];
    if (!picModel.isuploadPic) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]init];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            [self.picModelsArray removeAllObjects];
            for (UIImage *img in photos) {
                QGPicModel *model = [[QGPicModel alloc]init];
                model.uploadPic = img;
                model.isuploadPic = YES;
                [self.picModelsArray addObject:model];
            }
            [self reloadCollectionView];
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        [self.view endEditing:YES];
        return NO;
    }
    return YES;
}

/** 删除某个图片 */
- (void)deleteModel:(QGPicModel *)model{
    [self.picModelsArray removeObject:model];
    [self reloadCollectionView];
}

@end
