//
//  YSCTabBarController.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/19.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCTabBarController.h"
#import "YSCEssenceViewController.h"
#import "YSCNewViewController.h"
#import "YSCFriendTrendsViewController.h"
#import "YSCMeViewController.h"
#import "YSCTabBar.h"
#import "YSCNavigationController.h"

@interface YSCTabBarController ()

@end

@implementation YSCTabBarController

+ (void)initialize
{
    //通过appearance统一设置所有UITabBarItem的文字属性
    //方法后边带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:(UIControlStateNormal)];
    [item setTitleTextAttributes:selectAttrs forState:(UIControlStateSelected)];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    //添加子控制器
    [self setupChildVc:[[YSCEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[YSCNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[YSCFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[YSCMeViewController alloc] initWithStyle:UITableViewStyleGrouped] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    //更换tabBar
//    self.tabBar = [[YSCTabBar alloc] init];
    [self setValue:[[YSCTabBar alloc] init] forKey:@"tabBar"];  //KVC
    
}
- (void) setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
// 在这里更改颜色会加载全部控制器
    //包装一个导航控制器，添加导航控制器为tabbarcontroller的子控制器
    YSCNavigationController *nav = [[YSCNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];

}

@end
