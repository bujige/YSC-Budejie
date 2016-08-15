//
//  YSCRecommendCategoryCell.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/4/20.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCRecommendCategoryCell.h"
#import "YSCRecommendCategory.h"

@interface YSCRecommendCategoryCell()

/** 选中时显示的指示器控件 */
@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;

@end

@implementation YSCRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = YSCRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = YSCRGBColor(219, 21, 26);
    
    // 当cell的selection为None时, cell被选中时, 内部的子控件就不会进入高亮状态
    //    self.textLabel.textColor = XMGRGBColor(78, 78, 78);
    //    self.textLabel.highlightedTextColor = XMGRGBColor(219, 21, 26);
    //    UIView *bg = [[UIView alloc] init];
    //    bg.backgroundColor = [UIColor clearColor];
    //    self.selectedBackgroundView = bg;

}

- (void)setCategory:(YSCRecommendCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : YSCRGBColor(78, 78, 78);
}

@end
