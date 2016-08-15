//
//  YSCRecommendTag.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/23.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSCRecommendTag : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 名字 */
@property (nonatomic, copy) NSString *theme_name;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;

@end
