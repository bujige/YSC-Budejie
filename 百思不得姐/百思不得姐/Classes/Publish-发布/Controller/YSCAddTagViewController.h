//
//  YSCAddTagViewController.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/17.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSCAddTagViewController : UIViewController

/** 获取tags的block */
@property (nonatomic, copy) void (^tagsBlock)(NSArray *tags);

/** 所有的标签 */
@property (nonatomic, strong) NSArray *tags;

@end
