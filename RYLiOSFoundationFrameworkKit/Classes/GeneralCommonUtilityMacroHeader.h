//
//  GeneralCommonUtilityMacroHeader.h
//  IOTHomeFoundation
//
//  Created by RyanLee on 2018/2/5.
//  Copyright © 2018年 cniotroot.cn. All rights reserved.
//

#ifndef GeneralCommonUtilityMacroHeader_h
#define GeneralCommonUtilityMacroHeader_h

typedef void(^EmptyCallbackBlock)(void);

#define CheckTextNotEmptyOrReturn(obj,target,selector) if ([obj isKindOfClass:[NSString class]]) {\
    if ([obj length] == 0) {\
        if (target && [target respondsToSelector:selector]) {\
            [target performSelector:selector];\
        }\
        return;\
    }\
}

#define CheckTextNotEmptyOrReturnWithTips(obj,target,selector,tips) if ([obj isKindOfClass:[NSString class]]) {\
    if ([obj length] == 0) {\
        if (target && [target respondsToSelector:selector]) {\
            [target performSelector:selector withObject:tips];\
        }\
        return;\
    }\
}

#define CheckTextNotEmptyWithCallbackBlock(obj,block) if ([obj isKindOfClass:[NSString class]]) {\
    if ([obj length] == 0 ) {\
        if (block) {\
            block();\
        }\
        return;\
    }\
}

#define CheckTextNotEmptyWithCallbackBlockWithParam(obj,block,param) if ([obj isKindOfClass:[NSString class]]) {\
    if ([obj length] == 0 ) {\
        if (block) {\
            block(param);\
        }\
        return;\
    }\
}

#define PrintCurrentMethod NSLog(@"%@::..%@", self, NSStringFromSelector(_cmd));

#endif /* GeneralCommonUtilityMacroHeader_h */
