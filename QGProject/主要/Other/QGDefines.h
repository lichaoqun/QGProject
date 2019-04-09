//
//  QGDefines.h
//  QGProject
//
//  Created by QG on 2019/4/5.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#ifndef QGDefines_h
#define QGDefines_h

#define kiPhoneX ([DeviceHelper isPhoneX])
#define kNavigatonBarHei (kiPhoneX ? 88 : 64)
#define kTabbarHei  (kiPhoneX ? 83 : 49)
#define kStatusBarHei   (kiPhoneX ? 44 : 20)
#define kIndicatorHei   (kiPhoneX ? 34 : 0)

#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;


#endif /* QGDefines_h */
