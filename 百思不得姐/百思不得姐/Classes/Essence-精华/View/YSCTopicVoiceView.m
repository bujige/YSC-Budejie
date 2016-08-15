//
//  YSCTopicVoiceView.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/4.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCTopicVoiceView.h"
#import "YSCTopic.h"
#import <UIImageView+WebCache.h>
#import "YSCShowPictureViewController.h"

@interface YSCTopicVoiceView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *voicetimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;

@end

@implementation YSCTopicVoiceView


- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    
    // 给图片添加监听器
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}

- (void)showPicture
{
    YSCShowPictureViewController *showPicture = [[YSCShowPictureViewController alloc] init];
    showPicture.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
}

- (void)setTopic:(YSCTopic *)topic
{
    _topic = topic;
    
    // 图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    // 播放次数
    self.playcountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.playcount];
    
    // 时长
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    self.voicetimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
}

@end
