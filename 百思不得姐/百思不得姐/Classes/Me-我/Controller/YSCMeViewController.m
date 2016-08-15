//
//  YSCMeViewController.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/19.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCMeViewController.h"
#import "YSCMeCell.h"
#import "YSCMeFooterView.h"
#import "YSCSettingViewController.h"

@implementation YSCMeViewController

static NSString *YSCMeId = @"me";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];
    
    }

- (void)setupNav
{
    //设置导航栏标题
    self.navigationItem.title = @"我的";
    
    //设置导航栏右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon"  highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon"  highImage:@"mine-mine-moon-icon-click" target:self action:@selector(moonClick)];
//    [UIButton buttonWithType:UIButtonTypeCustom];
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
//    self.view.backgroundColor = YSCGlobalBg;
//    YSCLogFunc;

}

- (void)setupTableView
{
    // 设置背景色
    self.tableView.backgroundColor = YSCGlobalBg;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[YSCMeCell class] forCellReuseIdentifier:YSCMeId];
    
    // 调整header和footer
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = YSCTopicCellMargin;
    
    // 调整inset
    self.tableView.contentInset = UIEdgeInsetsMake(YSCTopicCellMargin - 35, 0, 0, 0);
    // 设置footerView
    self.tableView.tableFooterView = [[YSCMeFooterView alloc] init];
}

- (void)settingClick
{
     [self.navigationController pushViewController:[[YSCSettingViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
}

- (void)moonClick
{
    YSCLog(@"%s",__func__);
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSCMeCell *cell = [tableView dequeueReusableCellWithIdentifier:YSCMeId];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"mine_icon_nearby"];
        cell.textLabel.text = @"登录/注册";
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
}


@end
