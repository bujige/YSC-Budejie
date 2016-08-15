//
//  YSCRecommendUserCell.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/21.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendUserCell.h"
#import "YSCRecommendUser.h"
#import <UIImageView+WebCache.h>

@interface YSCRecommendUserCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end
@implementation YSCRecommendUserCell

- (void)setUser:(YSCRecommendUser *)user
{
    _user = user;
    
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注", user.fans_count];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

@end
