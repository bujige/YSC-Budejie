//
//  YSCCommentHeaderView.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/6.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSCCommentHeaderView : UITableViewHeaderFooterView

/** 文字数据 */
@property (nonatomic, copy) NSString *title;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
