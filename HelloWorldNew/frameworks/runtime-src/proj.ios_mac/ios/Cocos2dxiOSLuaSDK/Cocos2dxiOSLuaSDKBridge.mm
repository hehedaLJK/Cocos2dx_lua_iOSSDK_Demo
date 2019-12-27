//
//  Cocos2dxiOSLuaSDKBridge.m
//  HelloWorldNew-mobile
//
//  Created by 李金珂 on 2019/12/27.
//

#import "Cocos2dxiOSLuaSDKBridge.h"
#import "Cocos2dxiOSLuaSDK.h"


#import "cocos2d.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS || CC_TARGET_PLATFORM == CC_PLATFORM_MAC)
#include "scripting/lua-bindings/manual/platform/ios/CCLuaObjcBridge.h"
#endif
USING_NS_CC;

@implementation Cocos2dxiOSLuaSDKBridge

+(void)Cocos2dxiOSLuaSDKBridgeSelector:(NSDictionary *)dic{

    NSString *productId = dic[@"productId"];

    [Cocos2dxiOSLuaSDK showDetailPageWithProductId:productId];
    
    //以下为OC根据传入的函数ID回调lua函数的逻辑
    int functionId = [[dic objectForKey:@"functionId"] intValue];
    
    LuaObjcBridge::pushLuaFunctionById(functionId);
    //将需要传递给 Lua function 的参数放入 Lua stack
    
    //返回参数，注意必须进行utf-8转换否则编译报错，如要传递多个参数请将此处字符串转为json字符串传递
    LuaObjcBridge::getStack()->pushString([[NSString stringWithFormat:@"productId=%@", productId] UTF8String]);
    LuaObjcBridge::getStack()->executeFunction(1);//1个参数
    LuaObjcBridge::releaseLuaFunctionById(functionId);//释放
}

+(void)Cocos2dxiOSLuaSDKBridgeNoParameterSelector{
  
  [Cocos2dxiOSLuaSDK showDetailPageWithProductId:nil];

}

@end
