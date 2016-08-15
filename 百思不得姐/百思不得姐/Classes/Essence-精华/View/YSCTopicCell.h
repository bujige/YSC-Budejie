//
//  YSCTopicCell.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/30.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSCTopic;

@interface YSCTopicCell : UITableViewCell

/** 帖子数据 */
@property (nonatomic, strong) YSCTopic *topic;

@end
