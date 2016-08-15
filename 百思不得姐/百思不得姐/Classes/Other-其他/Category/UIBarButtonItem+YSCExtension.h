//
//  UIBarButtonItem+YSCExtension.h
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/20.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YSCExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
