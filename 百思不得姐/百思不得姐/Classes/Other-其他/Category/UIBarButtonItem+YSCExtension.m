//
//  UIBarButtonItem+YSCExtension.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/20.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "UIBarButtonItem+YSCExtension.h"

@implementation UIBarButtonItem (YSCExtension)

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
@end
