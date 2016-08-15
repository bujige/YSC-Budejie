//
//  UIImageView+YSCExtension.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/16.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "UIImageView+YSCExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (YSCExtension)

- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}

@end
