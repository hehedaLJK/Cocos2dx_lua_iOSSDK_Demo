//
//  Cocos2dxiOSLuaSDKBridge.h
//  HelloWorldNew-mobile
//
//  Created by 李金珂 on 2019/12/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cocos2dxiOSLuaSDKBridge : NSObject

//此处的方法作用为处理lua桥接文件的调用事件，并调用原生SDK

/*
cocos2dx框架限制，和lua交互的OC方法必须
1.是静态（+号）方法并且无返回值。
2.参数只能是无或者字典类型。
如果上述内容任意一项有误则在后续运行Xcode项目lua调用OC桥接函数时会报`INVALID METHOD SIGNATURE`错误

此处的方法命名无特殊要求，只要iOS开发者能明白是干什么的就行。
cocos2dx开发者不会关心这个名字，一般来说也看不到这个名字。
*/
+(void)Cocos2dxiOSLuaSDKBridgeSelector:(NSDictionary *)dic;

+(void)Cocos2dxiOSLuaSDKBridgeNoParameterSelector;

@end

NS_ASSUME_NONNULL_END
