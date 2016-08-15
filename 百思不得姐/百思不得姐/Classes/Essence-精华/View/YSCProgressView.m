//
//  YSCProgressView.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/1.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCProgressView.h"

@implementation YSCProgressView

- (void)awakeFromNib
{
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    
    NSString *text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
    self.progressLabel.text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
