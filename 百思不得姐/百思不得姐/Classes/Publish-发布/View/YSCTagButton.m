//
//  YSCTagButton.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/17.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCTagButton.h"

@implementation YSCTagButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"chose_tag_close_icon"] forState:UIControlStateNormal];
        self.backgroundColor = YSCTagBg;
        self.titleLabel.font = YSCTagFont;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
    self.width += 3 * YSCTagMargin;
    self.height = YSCTagH;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = YSCTagMargin;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + YSCTagMargin;
}


@end
