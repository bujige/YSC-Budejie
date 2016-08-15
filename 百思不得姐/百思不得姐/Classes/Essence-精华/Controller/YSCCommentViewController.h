//
//  YSCCommentViewController.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/6.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSCTopic;

@interface YSCCommentViewController : UIViewController

/** 帖子模型 */
@property (nonatomic, strong) YSCTopic *topic;

@end
