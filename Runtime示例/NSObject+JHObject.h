//
//  NSObject+JHObject.h
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/19.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JHObject)
//@property分类：只会生成set,get方法声明，不会生成实现，也不会生成下划线成员属性
@property NSString *name;
@end
