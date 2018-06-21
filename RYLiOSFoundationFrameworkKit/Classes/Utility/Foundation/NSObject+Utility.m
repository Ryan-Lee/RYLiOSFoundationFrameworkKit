//
//  NSObject+Utility.m
//  CNICGiOSFoundationFrameworkKit
//
//  Created by RyanLee on 2018/3/8.
//

#import "NSObject+Utility.h"

@implementation NSObject (Utility)

- (NSString *)printPrettyJSONDescription_UTF8 {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end
