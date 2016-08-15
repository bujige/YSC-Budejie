//
//  YSCRecommendTagsViewController.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/23.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendTagsViewController.h"
#import "YSCRecommendTagCell.h"
#import "YSCRecommendTag.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <MJExtension.h>

@interface YSCRecommendTagsViewController ()

@property (nonatomic, strong) NSArray *tags;

@end

static NSString *const YSCTagsId = @"tag";

@implementation YSCRecommendTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadTags];
}

- (void) setupTableView
{
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YSCRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:YSCTagsId];
    
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = YSCGlobalBg;
}

- (void) loadTags
{
    [SVProgressHUD showWithMaskType:(SVProgressHUDMaskTypeBlack)];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tags = [YSCRecommendTag objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败!"];
        
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tags.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YSCRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:YSCTagsId];
    
    cell.recommendTag = self.tags[indexPath.row];
    
    return cell;
}

@end
