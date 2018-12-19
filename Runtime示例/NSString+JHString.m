//
//  NSString+JHString.m
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/18.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import "NSString+JHString.h"
#import <objc/message.h>
@implementation NSString (JHString)
//把类加载进内存的时候调用，只会调用一次
+ (void)load {
    Method fun1 = class_getClassMethod(self, @selector(stringWithString:));
    Method fun2 = class_getClassMethod(self, @selector(jh_stringWithString:));
    method_exchangeImplementations(fun1, fun2);
}

+ (NSString *)jh_stringWithString:(NSString *)string{
    NSString *str = [NSString jh_stringWithString:string];
    if (str) {
        NSLog(@"有值");
    }else{
        NSLog(@"没有值");
    }
    return str;
}
@end
