//
//  YSCRecommendTagCell.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/23.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendTagCell.h"
#import "YSCRecommendTag.h"
#import <UIImageView+WebCache.h>

@interface YSCRecommendTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end
@implementation YSCRecommendTagCell

- (void)awakeFromNib {
}

-(void)setRecommendTag:(YSCRecommendTag *)recommendTag
{
    _recommendTag = recommendTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.themeNameLabel.text = recommendTag.theme_name;
    NSString *subNumber = nil;
    if (recommendTag.sub_number < 10000) {
        subNumber = [NSString stringWithFormat:@"%zd人订阅",recommendTag.sub_number];
    } else {
        subNumber = [NSString stringWithFormat:@"%.1f万人订阅",recommendTag.sub_number / 10000.0];
    }
    self.subNumberLabel.text = subNumber;
}

- (void)setFrame:(CGRect)frame
{
//    frame.origin.x = 5;
//    frame.size.width -= frame.origin.x * 2;
    frame.size.height -= 1;
    
    [super setFrame:frame];
}
@end
