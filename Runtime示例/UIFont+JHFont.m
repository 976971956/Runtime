//
//  UIFont+JHFont.m
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/18.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import "UIFont+JHFont.h"
#import <objc/message.h>
@implementation UIFont (JHFont)
//把类加载进内存的时候调用，只会调用一次
+(void)load {
//    系统方法
    Method fun1 = class_getClassMethod(self, @selector(systemFontOfSize:));
//    自定义UIFont字体类型的方法
    Method fun2 = class_getClassMethod(self, @selector(jh_systemFontOfSize:));
//    交换方法1和方法2
    method_exchangeImplementations(fun1, fun2);

}
+ (UIFont *)jh_systemFontOfSize:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
    return font;
}


@end
