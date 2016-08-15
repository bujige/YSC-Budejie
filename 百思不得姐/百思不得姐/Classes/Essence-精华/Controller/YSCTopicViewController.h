//
//  YSCTopicViewController.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/5/2.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSCTopicViewController : UITableViewController

/** 帖子类型(交给子类去实现) */
@property (nonatomic, assign) YSCTopicType type;

@end
