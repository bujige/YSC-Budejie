//
//  YSCTagTextField.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/17.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSCTagTextField : UITextField
/** 按了删除键后的回调 */
@property (nonatomic, copy) void (^deleteBlock)();
@end
