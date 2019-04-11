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
@end

// - MARK: <-- textModel -->
@implementation QGTopicDetailTextContentModel
/** cell的高度 */
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - (2 * kCellLRPadding);
    CGFloat textHei = [self.content heightForFont:fontNormal16() width:width];
    return (10 + ceilf(textHei));
}
@end

// - MARK: <-- imageModel -->
@implementation QGTopicDetailImageContentModel
/** cell的高度 */
- (CGFloat)cellHeight{
    CGFloat width = kScreenWidth - (2 * kCellLRPadding);
    return 10 + ((self.imgHeight / self.imgWidth) * width);
}
@end
