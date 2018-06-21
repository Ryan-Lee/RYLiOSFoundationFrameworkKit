//
//  IOTBaseRequest.m
//  CNICGiOSFoundationFrameworkKit
//
//  Created by RyanLee on 2018/2/26.
//

#import "IOTBaseRequest.h"
#import "NSObject+Utility.h"
#import <YYModel/YYModel.h>
#import "UIView+Utility.h"
#import <Toast/Toast.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface IOTBaseRequest()<YTKRequestDelegate>
@property (nonatomic, copy) IOTBaseResponseCallbackBlock responseCallbackBlock;
@end

@implementation IOTBaseRequest

#if defined DEBUG && DEBUG == 1
+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [YTKNetworkConfig sharedConfig].debugLogEnabled = YES;
    });
}
#endif

- (void)dealloc {
    NSLog(@"请求%@已销毁释放",self);
}

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL {
    if (self = [self init]) {
        _param = [param copy];
        _requestURL = requestURL;
    }
    return self;
}

+ (instancetype)requestWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL {
    return [[self alloc] initWithParam:param requestURL:requestURL];
}

+ (instancetype)requestWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL startWithCallbackBlock:(IOTBaseResponseCallbackBlock)block {
    IOTBaseRequest *request = [self requestWithParam:param requestURL:requestURL];
    [request startWithCallbackBlock:block];
    return request;
}

- (NSString *)requestUrl {
    if (self.requestURL) {
        return self.requestURL;
    }
    return [super requestUrl];
}

- (id)requestArgument {
    if (self.param) {
        return self.param;
    }
    return [super requestArgument];
}

- (NSString *)baseUrl {
    if (self.baseURL) {
        return self.baseURL;
    } else {
        return [super baseUrl];
    }
}

- (void)start {
    if (self.automaticLoadingHUDEnabled) {
        [MBProgressHUD showHUDAddedTo:UIApplication.sharedApplication.keyWindow animated:YES];
    }
    [super start];
}

- (void)stop {
    [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
    [super stop];
}

- (void)startWithCallbackBlock:(IOTBaseResponseCallbackBlock)block {
    self.responseCallbackBlock = block;
    [self startWithCompletionBlockWithSuccess:^(__kindof IOTBaseRequest *request) {
        [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
        if (block) {
            block(request.responseObject, request.error);
        }
    } failure:^(__kindof IOTBaseRequest *request) {
        [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
        if (block) {
            block(request.responseObject, request.error);
        }
    }];
    NSLog(@"\n*********************************开始发送请求:*********************************\n%@\n%@\n", self.currentRequest.allHTTPHeaderFields, self);
}

- (void)startWithModelClass:(Class)modelClass jsonKey:(NSString *)key callbackBlock:(IOTBaseResponseCallbackBlockWithModel)block {
    [self startWithCompletionBlockWithSuccess:^(__kindof IOTBaseRequest *request) {
        [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
        if (block && modelClass) {
            NSObject *model;
            if (key && key.length > 0) {
                model = [modelClass yy_modelWithJSON:[request.responseJSONObject valueForKeyPath:key]];
            } else {
                model = [modelClass yy_modelWithJSON:request.responseJSONObject];
            }
            block(model, request.error);
        } else {
            NSError *error = [[NSError alloc] initWithDomain:@"parameters.error" code:400400 userInfo:@{@"localizedDescriptionss":@"调用方法没有传block或者modelClass参数"}];
            block(nil, error);
        }
    }  failure:^(__kindof IOTBaseRequest *request) {
        [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
        if (block) {
            block(nil, request.error);
        }
    }];
    NSLog(@"\n*********************************开始发送请求:*********************************\n%@\n%@\n", self.currentRequest.allHTTPHeaderFields, self);
}

//- (NSTimeInterval)requestTimeoutInterval {
//    return 3;
//}

#pragma mark - YTKRequestDelegate

- (void)requestFinished:(__kindof YTKBaseRequest *)request {
    [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
    NSLog(@"\n*********************************成功响应:*********************************\n%@\n%@\n状态码:%ld\n响应头部:%@\n", request, [request.responseObject printPrettyJSONDescription_UTF8], (long)request.responseStatusCode, request.responseHeaders);
}

- (void)requestFailed:(__kindof YTKBaseRequest *)request {
    [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
    NSLog(@"\n*********************************失败响应:*********************************\n%@\n%@\n状态码:%ld\n响应头部:%@\n错误：%@\n", request, [request.responseObject printPrettyJSONDescription_UTF8], (long)request.responseStatusCode, request.responseHeaders, request.error);
#if defined DEBUG && DEBUG == 1
    if (self.enabledRequstAPIFailedErrorDebugLogUI) {
        [UIApplication.sharedApplication.keyWindow makeToast:request.error.localizedDescription duration:3 position:CSToastPositionCenter];
    }
#endif
}

@end
