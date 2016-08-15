//
//  YSCPushGuideView.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/27.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCPushGuideView.h"

@implementation YSCPushGuideView

+ (void)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获取当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    // 获取沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        YSCPushGuideView *guideView = [YSCPushGuideView viewFromXib];
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)close {
    [self removeFromSuperview];
}


@end
