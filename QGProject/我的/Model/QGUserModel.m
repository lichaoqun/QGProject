//
//  QGUserModel.m
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGUserModel.h"

@implementation QGUserModel
/** 用户名 */
- (NSString *)userName{
    return @"李超群测试测试测试测试测试测试测试测试测试测试测试";
}

/** 用户头像 */
- (NSString *)userIcon{
    return @"http://upstatic.qiecdn.com/upload/homeset/201904011524085965.jpg";
}

/** 用户手机号 */
- (NSString *)userPhoneNum{
    return @"18211159457";
}

-(void)setToken:(NSString *)token{
    _token = token;
    if (token) {
        [[NSUserDefaults standardUserDefaults]setObject:token forKey:kTokenSaveKey];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
@end
