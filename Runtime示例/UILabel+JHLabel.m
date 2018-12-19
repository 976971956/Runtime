//
//  UILabel+JHLabel.m
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/19.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import "UILabel+JHLabel.h"
#import <objc/message.h>
@implementation UILabel (JHLabel)

//    //判断类中是否包含某个方法的实现
//    BOOL class_respondsToSelector(Class cls, SEL sel)
//    //获取类中的方法列表
//    Method *class_copyMethodList(Class cls, unsigned int *outCount)
//    //为类添加新的方法,如果方法该方法已存在则返回NO
//    BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
//    //替换类中已有方法的实现,如果该方法不存在添加该方法
//    IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
//    //获取类中的某个实例方法(减号方法)
//    Method class_getInstanceMethod(Class cls, SEL name)
//    //获取类中的某个类方法(加号方法)
//    Method class_getClassMethod(Class cls, SEL name)
//    //获取类中的方法实现
//    IMP class_getMethodImplementation(Class cls, SEL name)
//    //获取类中的方法的实现,该方法的返回值类型为struct
//    IMP class_getMethodImplementation_stret(Class cls, SEL name)
//
//    //获取Method中的SEL
//    SEL method_getName(Method m)
//    //获取Method中的IMP
//    IMP method_getImplementation(Method m)
//    //获取方法的Type字符串(包含参数类型和返回值类型)
//    const char *method_getTypeEncoding(Method m)
//    //获取参数个数
//    unsigned int method_getNumberOfArguments(Method m)
//    //获取返回值类型字符串
//    char *method_copyReturnType(Method m)
//    //获取方法中第n个参数的Type
//    char *method_copyArgumentType(Method m, unsigned int index)
//    //获取Method的描述
//    struct objc_method_description *method_getDescription(Method m)
//    //设置Method的IMP
//    IMP method_setImplementation(Method m, IMP imp)
//    //替换Method
//    void method_exchangeImplementations(Method m1, Method m2)
//
//    //获取SEL的名称
//    const char *sel_getName(SEL sel)
//    //注册一个SEL
//    SEL sel_registerName(const char *str)
//    //判断两个SEL对象是否相同
//    BOOL sel_isEqual(SEL lhs, SEL rhs)
//
//    //通过块创建函数指针,block的形式为^ReturnType(id self,参数,...)
//    IMP imp_implementationWithBlock(id block)
//    //获取IMP中的block
//    id imp_getBlock(IMP anImp)
//    //移出IMP中的block
//    BOOL imp_removeBlock(IMP anImp)
//
//    //调用target对象的sel方法
//    id objc_msgSend(id target, SEL sel, 参数列表...)

//把类加载进内存的时候调用，只会调用一次
+(void)load {
//    class_getInstanceMethod//对象方法
//    class_getClassMethod//类方法
    Method jh_init = class_getInstanceMethod([self class], @selector(jh_init));
    Method jh_initWithFrame = class_getInstanceMethod([self class], @selector(jh_initWithFrame:));
    Method jh_awakeFromNib = class_getInstanceMethod([self class], @selector(jh_awakeFromNib));
    Method init = class_getInstanceMethod([self class], @selector(init));
    Method initWithFrame = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method awakeFromNib = class_getInstanceMethod([self class], @selector(awakeFromNib));
    
//    类动态添加方法,为类添加新的方法,如果方法该方法已存在则返回NO
//    判断init方法是否实现，如果没实现便添加新方法jh_init
    BOOL isInit = class_addMethod([self class], @selector(init), method_getImplementation(jh_init), method_getTypeEncoding(jh_init));
    BOOL isInitWithFrame = class_addMethod([self class], @selector(initWithFrame:), method_getImplementation(jh_initWithFrame), method_getTypeEncoding(jh_initWithFrame));
    BOOL isAwakeFromNib = class_addMethod([self class], @selector(awakeFromNib), method_getImplementation(jh_awakeFromNib), method_getTypeEncoding(jh_awakeFromNib));
    if (isInit) {//init没实现
        //替换类中已有方法的实现,如果该方法不存在添加该方法
        class_replaceMethod(self, @selector(jh_init), method_getImplementation(init), method_getTypeEncoding(init));
    }else{//init已实现，直接交换方法
        method_exchangeImplementations(init, jh_init);
    }
    if (isInitWithFrame) {//init不存在
        //替换类中已有方法的实现,如果该方法不存在添加该方法
        class_replaceMethod(self, @selector(jh_initWithFrame:), method_getImplementation(initWithFrame), method_getTypeEncoding(initWithFrame));
    }else{//init已存在，直接交换方法
        method_exchangeImplementations(initWithFrame, jh_initWithFrame);
    }
    if (isAwakeFromNib) {//init不存在
        //替换类中已有方法的实现,如果该方法不存在添加该方法
        class_replaceMethod(self, @selector(jh_awakeFromNib), method_getImplementation(awakeFromNib), method_getTypeEncoding(awakeFromNib));
    }else{//init已存在，直接交换方法
        method_exchangeImplementations(awakeFromNib, jh_awakeFromNib);
    }

}
#pragma mark --要交换的方法
-(instancetype)jh_init{
    id obj = [self jh_init];
    self.font = [UIFont fontWithName:@"Helvetica-Bold" size:self.font.pointSize];
    return obj;
}
-(instancetype)jh_initWithFrame:(CGRect)frame{
    id obj = [self jh_initWithFrame:frame];
    self.font = [UIFont fontWithName:@"Helvetica-Bold" size:self.font.pointSize];

    return obj;
}
-(void)jh_awakeFromNib{
    [self jh_awakeFromNib];
    self.font = [UIFont fontWithName:@"Helvetica-Bold" size:self.font.pointSize];

}
@end
