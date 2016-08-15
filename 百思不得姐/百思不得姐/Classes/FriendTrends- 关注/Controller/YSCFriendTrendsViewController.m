//
//  YSCFriendTrendsViewController.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/19.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCFriendTrendsViewController.h"
#import "YSCRecommendViewController.h"
#import "YSCLoginRegisterViewController.h"

@interface YSCFriendTrendsViewController ()

@end

@implementation YSCFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.title = @"我的关注";

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon"  highImage:@"friendsRecommentIcon" target:self action:@selector(friendsClick)];
    self.view.backgroundColor = YSCGlobalBg;
}

- (void)friendsClick
{
    YSCRecommendViewController *vc = [[YSCRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginRegister {
    YSCLoginRegisterViewController *login = [[YSCLoginRegisterViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}


@end
