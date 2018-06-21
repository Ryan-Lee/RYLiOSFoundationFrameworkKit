//
//  NSObject+Utility.h
//  CNICGiOSFoundationFrameworkKit
//
//  Created by RyanLee on 2018/3/8.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utility)
@property (nonatomic, readonly) NSString *printPrettyJSONDescription_UTF8;
///debug console中打印中文字符
- (NSString *)printPrettyJSONDescription_UTF8;

@end
