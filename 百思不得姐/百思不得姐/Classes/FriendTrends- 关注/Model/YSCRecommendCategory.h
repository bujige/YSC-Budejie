//
//  YSCRecommendCategory.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/21.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSCRecommendCategory : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;

/** 这个类别对应的用户数据 */
@property (nonatomic, strong) NSMutableArray *users;
/** 总页数*/
@property (nonatomic, assign) NSInteger total;
/** 当前页码*/
@property (nonatomic, assign) NSInteger currentPage;

@end
