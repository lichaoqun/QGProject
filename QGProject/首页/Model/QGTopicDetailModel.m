//
//  QGTopicDetailModel.m
//  QGProject
//
//  Created by QG on 2019/4/8.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGTopicDetailModel.h"

@implementation QGTopicDetailModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"contentLinkSummaries" : [QGTopicDetailTextContentModel class],
             @"contentLinkPhotos" : [QGTopicDetailImageContentModel class]
             };
}

@end
