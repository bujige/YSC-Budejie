//
//  YSCComment.h
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/4.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YSCUser;

@interface YSCComment : NSObject
/** id */
@property (nonatomic, copy) NSString *ID;
/** 音频文件的时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 音频文件的路径 */
@property (nonatomic, copy) NSString *voiceuri;
/** 评论的文字内容 */
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量 */
@property (nonatomic, assign) NSInteger like_count;
/** 用户 */
@property (nonatomic, strong) YSCUser *user;

@end
