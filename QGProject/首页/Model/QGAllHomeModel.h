//
//  QGAllHomeModel.h
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGModel.h"
#import "QGAllTopicDetailModel.h"

@interface QGHomeBaseModel : QGModel

@end

// - MARK: <-- sliderModel -->
@interface QGHomeSlierModel : QGHomeBaseModel

/** slider 图片 URL */
@property(nonatomic, copy)NSString *sliderUrl;

/** slider 的 id */
@property(nonatomic, copy)NSString *sliderId;

/** slider 的 标题 */
@property(nonatomic, copy)NSString *sliderTitle;

@end

// - MARK: <-- categoryModel -->
@interface QGHomeCategoryModel : QGHomeBaseModel

/** 分类的 id */
@property(nonatomic, copy)NSString *cateId;

/** 分类的名字 */
@property(nonatomic, copy)NSString *cateName;

/** 分类的图片的地址 */
@property(nonatomic, copy)NSString *cateIconUrl;

@end

// - MARK: <-- topicModel -->
@interface QGHomeTopicModel : QGHomeBaseModel

/** 帖子内容的 id */
@property(nonatomic, copy)NSString *topicID;

/** 标题的label */
@property (nonatomic, strong) QGTopicDetailTitleContentModel *topicTitle;

/** 帖子内容的简介 */
@property(nonatomic, copy)NSString *topicDesc;

/** 帖子内容的图片 */
@property(nonatomic, copy)NSString *topicImageUrl;

/** 帖子作者 */
@property (nonatomic, strong) QGUserModel *user;

/** 是否是图片模式的 cell */
@property(nonatomic, assign, readonly)BOOL showDesImageView;

/** cell的高度 */
@property(nonatomic, assign)CGFloat cellHeight;

@end
