//
//  NSNotificationCenter+IOTNotificationNameAndUserInfoKey.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2018/1/17.
//  Copyright © 2018年 cniotroot.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const IOTShouldRefreshMainHomeNotification;
FOUNDATION_EXTERN NSString *const IOTDidChangedUserInfoNotification;

@interface NSNotificationCenter (IOTNotificationNameAndUserInfoKey)

@end
