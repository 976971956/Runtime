//
//  UIFont+JHFont.h
//  Runtime示例
//
//  Created by 李江湖 on 2018/12/18.
//  Copyright © 2018年 李江湖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (JHFont)

+ (UIFont *)jh_systemFontOfSize:(CGFloat)size;
+ (UIFont *)jh_fontWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)pointSize;
@end
