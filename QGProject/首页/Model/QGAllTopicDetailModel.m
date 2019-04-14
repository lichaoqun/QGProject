//
//  QGAllTopicDetailModel.m
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGAllTopicDetailModel.h"

@implementation QGTopicDetailContentModel

@end

// - MARK: <-- titleModel -->
@implementation QGTopicDetailTitleContentModel
/** cell的高度 */
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - (2 * kCellLRPadding);
    CGFloat textHei = [self.contentTitle heightForFont:fontBold16() width:width];
    return (10 + ceilf(textHei) + 10 + 20);
}

- (QGTopicModelType)type{
    return QGTopicModelTypeTitle;
}
@end

// - MARK: <-- textModel -->
@implementation QGTopicDetailTextContentModel
/** cell的高度 */
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - (2 * kCellLRPadding);
    CGFloat textHei = [self.contentSummary heightForFont:fontNormal16() width:width];
    return (10 + ceilf(textHei));
}

- (QGTopicModelType)type{
    return QGTopicModelTypeText;
}
@end

// - MARK: <-- imageModel -->
@implementation QGTopicDetailImageContentModel
/** cell的高度 */
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - (2 * kCellLRPadding);
    return 10 + ((self.imgHeight / self.imgWidth) * width);
}

- (QGTopicModelType)type{
    return QGTopicModelTypeImage;
}
@end

// - MARK: <-- 评论的 model -->
@implementation QGTopicDetailCommentContentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"commentReturns" : [QGTopicDetailCommentContentModel class]};
}
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - kCellLRPadding - 30 - 10 - kCellLRPadding;
    CGFloat textHei = [self.commentDetail heightForFont:fontNormal14() width:width];
    CGFloat padding = 10 * 2;
    CGFloat avatarHei = padding + 30;
    textHei = padding + textHei + 20 + 15;
    return (MAX(avatarHei, textHei));
}

- (QGTopicModelType)type{
    return QGTopicModelTypeCommont;
}

@end
