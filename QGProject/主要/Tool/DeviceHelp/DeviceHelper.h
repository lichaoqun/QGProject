//
//  DeviceHelper.h
//  DYZB
//
//  Created by 周兵 on 15-3-18.
//  Copyright (c) 2015年 mydouyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

@interface DeviceHelper : NSObject

+ (BOOL)isPhoneX;

@end

