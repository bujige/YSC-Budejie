//
//  YSCNewViewController.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/19.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCNewViewController.h"

@interface YSCNewViewController ()

@end

@implementation YSCNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon"  highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.view.backgroundColor = YSCGlobalBg;
    YSCLogFunc;
}

- (void)tagClick
{
    YSCLog(@"%s",__func__);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = YSCRGBColor(200, 100, 50);
//    [self.navigationController pushViewController:vc animated:YES];
//}

@end
