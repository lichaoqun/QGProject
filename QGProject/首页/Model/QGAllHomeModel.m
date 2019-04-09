//
//  QGAllHomeModel.m
//  QGProject
//
//  Created by 李超群 on 2019/4/9.
//  Copyright © 2019 xinxianzhizao. All rights reserved.
//

#import "QGAllHomeModel.h"

@implementation QGHomeBaseModel

@end

// - MARK: <-- sliderModel -->
@implementation QGHomeSlierModel

@end

// - MARK: <-- categoryModel -->
@implementation QGHomeCategoryModel

@end

// - MARK: <-- topicModel -->
@implementation QGHomeTopicModel

-(BOOL)showDesImageView{
    return ((self.topicImageUrl) && (self.topicImageUrl.length > 0));
}

@end
