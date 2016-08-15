//
//  YSCRecommendViewController.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/20.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendViewController.h"
#import "YSCRecommendCategoryCell.h"
#import "YSCRecommendCategory.h"
#import "YSCRecommendUserCell.h"
#import "YSCRecommendUser.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh.h>

@interface YSCRecommendViewController () <UITableViewDelegate, UITableViewDataSource>
/** 左边的类别数据*/
@property (nonatomic, strong) NSArray *categories;
/** 左边的类别表格*/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右边的用户表格*/
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/** 请求参数*/
@property (nonatomic, strong) NSMutableDictionary *params;

/** AFN请求管理者*/
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation YSCRecommendViewController

static NSString * const YSCCategoryId = @"category";
static NSString * const YSCUserId = @"user";

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化控制器
    [self setupTableView];
  
    // 添加刷新控件
    [self setupRefresh];
    
    // 加载左侧类别数据
    [self loadCategories];
}

/**
 * 添加刷新控件
 */
- (void)setupRefresh
{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userTableView.mj_footer.hidden = YES;
}
/**
 * 加载左侧的类别数据
 */
- (void)loadCategories
{
    
    // 显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    // 发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        // 隐藏指示器
        [SVProgressHUD dismiss];
        
        // 服务器返回的JSON数据
        self.categories = [YSCRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新左侧表格
        [self.categoryTableView reloadData];
        
        // 默认选择第一行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        // 让用户表格进入下拉刷新状态
        [self.userTableView.header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
    }];
}

- (void)loadNewUsers
{
    YSCRecommendCategory *rc = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
    // 设置当前页码为 1
    rc.currentPage = 1;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.id);
    params[@"page"] = @(rc.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 字典数组 -> 模型数组
        NSArray *users = [YSCRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 清除旧数据
        [rc.users removeAllObjects];
        
        // 添加到当前类别对应的用户数组中
        [rc.users addObjectsFromArray:users];
        
        // 保存总页数
        rc.total = [responseObject[@"total"] integerValue];
        
        // 不是最后一次刷新
        if (self.params != params)  return ;
        
        // 刷新右侧表格
        [self.userTableView reloadData];
        
        // 结束刷新
        [self.userTableView.mj_header endRefreshing];
        
        // 让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != params) return;
        
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
      
        // 结束刷新
        [self.userTableView.header endRefreshing];
    }];
    
}
- (void) loadMoreUsers
{
    YSCRecommendCategory *category = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
    
    // 发送请求给服务器, 加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.currentPage);
    self.params = params;

    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 字典数组 -> 模型数组
        NSArray *users = [YSCRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];

        // 添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.userTableView reloadData];
        
        // 让底部控件结束刷新
        [self checkFooterState];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        // 让底部控件结束刷新
        [self.userTableView.footer endRefreshing];
    }];
}
/**
 * 时刻检测 footer 状态
 */
- (void) checkFooterState
{
    YSCRecommendCategory *rc = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
    
    //每次刷新右边数据时，都控制footer显示或隐藏
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    
    //让底部控件结束刷新
    if (rc.users.count == rc.total) {   // 加载完毕
        [self.userTableView.mj_footer noticeNoMoreData];
    } else {    // 还没有加载完
        [self.userTableView.mj_footer endRefreshing];
    }
}
- (void)setupTableView
{
    //注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YSCRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:YSCCategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YSCRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:YSCUserId];
    
    //设置标题
    self.title = @"推荐关注";
    
    //设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    
    //设置背景色
    self.view.backgroundColor = YSCGlobalBg;
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {  // 左侧类别表格
        return self.categories.count;
    } else {    // 右侧用户表格
         // 监测footer的状态
        [self checkFooterState];
        
        return [self.categories[self.categoryTableView.indexPathForSelectedRow.row] users].count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {  //左侧类别表格
        YSCRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:YSCCategoryId];
        
        cell.category = self.categories[indexPath.row];
        
        return cell;
    } else {    // 右侧用户表格
        YSCRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:YSCUserId];
        
        cell.user = [self.categories[self.categoryTableView.indexPathForSelectedRow.row] users][indexPath.row];
        
        return cell;
    }
    
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 结束刷新
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    YSCRecommendCategory *c = self.categories[indexPath.row];
    
    if (c.users.count) {
        [self.userTableView reloadData];
    } else {
        // 刷新右边的表格
        [self.userTableView reloadData];
        
        // 进入下拉刷新状态
        [self.userTableView.mj_header beginRefreshing];
    }
}

#pragma mark - 控制器的销毁
- (void)dealloc
{
    // 停止所有操作
    [self.manager.operationQueue cancelAllOperations];
}

@end
