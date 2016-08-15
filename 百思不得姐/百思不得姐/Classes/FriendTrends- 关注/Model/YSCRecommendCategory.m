//
//  YSCRecommendCategory.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/21.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendCategory.h"

@implementation YSCRecommendCategory

- (NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}


@end
