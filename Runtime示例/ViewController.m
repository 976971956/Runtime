//
//  ViewController.m
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/18.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "NSObject+JHObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    p = objc_msgSend(p, sel_registerName("init"));
    objc_msgSend(p, sel_registerName("eat"));
    objc_msgSend(p, sel_registerName("runNum:"),20.0);
//    runtime交换方法
    
    NSString *url = @"2";
//stringWithString:方法中判断url是否有值
    NSString *str = [NSString stringWithString:url];
    
/// MARK -交换方法
//    需求：替换系统默认文字类型
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 64, 320, 800)];
    lable.text = @"牛爱吃草，鸟爱吃虫，狗爱吃屎，猫爱吃鱼牛爱吃草，鸟爱吃虫，狗爱吃屎，猫爱吃鱼牛爱吃草，鸟爱吃虫，狗爱吃屎，猫爱吃鱼牛爱吃草，鸟爱吃虫，狗爱吃屎，猫爱吃鱼";
    lable.numberOfLines = 0;
//    要求：交换UIFont系统方法,实现修改系统默认字体，不足：xib创建的不能修改，
    lable.font = [UIFont systemFontOfSize:24];
    
    [self.view addSubview:lable];
// 同时修改xib和存代码的字体类型需要生成UILabel的分类----UILabel+JHLabel中实现
//    动态添加方法
//    动态添加属性
    NSObject *obj = [[NSObject alloc]init];
    obj.name = @"11";
    NSLog(@"%@",obj.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
