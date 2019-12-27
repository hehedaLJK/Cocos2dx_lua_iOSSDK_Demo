//
//  Cocos2dxiOSLuaSDK.m
//  HelloWorldNew-mobile
//
//  Created by 李金珂 on 2019/12/27.
//

#import "Cocos2dxiOSLuaSDK.h"

@implementation Cocos2dxiOSLuaSDK

+ (void)showDetailPageWithProductId:(NSString *)productId{

     if (productId) {
          NSLog(@"lua 调用 iOSSDK成功 productId:%@", productId);
     }else{
          NSLog(@"lua 调用 iOSSDK成功 productId为空");
     }

}

@end
