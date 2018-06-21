//
//  IOTBaseRequest.h
//  CNICGiOSFoundationFrameworkKit
//
//  Created by RyanLee on 2018/2/26.
//

#import <YTKNetwork/YTKNetwork.h>

typedef void(^IOTBaseResponseCallbackBlock)(NSObject *responseObject, NSError *error);
typedef void(^IOTBaseResponseCallbackBlockWithModel)(NSObject *model, NSError *error);

///API服务器接口请求基础类
@interface IOTBaseRequest : YTKRequest

#pragma mark - 可选初始化，用于较简单明了的请求
+ (instancetype)requestWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL ;
- (instancetype)initWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL ;
+ (instancetype)requestWithParam:(NSDictionary *)param requestURL:(NSString *)requestURL startWithCallbackBlock:(IOTBaseResponseCallbackBlock)block;

///开始发送请求
- (void)startWithCallbackBlock:(IOTBaseResponseCallbackBlock)block;
///开始发送请求，参数及回调集成YYModel，jsonKey是指要解析的model在整个json中value对应的key，如果整个json都是要解析成model，jsonKey传nil
- (void)startWithModelClass:(Class)modelClass jsonKey:(NSString *)key callbackBlock:(IOTBaseResponseCallbackBlockWithModel)block;

///host地址
@property (nonatomic, copy) NSString *baseURL;
///组装好的查询参数
@property (nonatomic, copy) NSDictionary *param;
///url
@property (nonatomic, copy) NSString *requestURL;

///是否加入自动网络loading MBProgressHUD菊花，默认不加，需要加才要设置
@property (nonatomic) BOOL automaticLoadingHUDEnabled;

#if DEBUG
///启动请求失败error提示UI，默认关闭
@property (nonatomic) BOOL enabledRequstAPIFailedErrorDebugLogUI;
#endif

#pragma mark - YTKRequestDelegate

- (void)requestFinished:(__kindof YTKBaseRequest *)request;

- (void)requestFailed:(__kindof YTKBaseRequest *)request;

@end
