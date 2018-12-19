//
//  NSObject+JHObject.m
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/19.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import "NSObject+JHObject.h"
#import <objc/message.h>
@implementation NSObject (JHObject)

-(void)setName:(NSString *)name{
    //object:给那个对象添加属性
//    key 属性名称
//    value 属性值
//    policy 保存策略
//    objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_COPY);
}
-(NSString *)name{
    return objc_getAssociatedObject(self, "name");
}
@end
