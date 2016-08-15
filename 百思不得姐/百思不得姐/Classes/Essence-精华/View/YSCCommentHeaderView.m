//
//  YSCCommentHeaderView.m
//  YSC-百思不得姐
//
//  Created by YangLunlong on 16/7/6.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCCommentHeaderView.h"

@interface YSCCommentHeaderView()

/** 文字标签 */
@property (nonatomic, weak) UILabel *label;

@end

@implementation YSCCommentHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    YSCCommentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) { // 缓存池中没有, 自己创建
        header = [[YSCCommentHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = YSCGlobalBg;
        
        // 创建label
        UILabel *label = [[UILabel alloc] init];
        label.textColor = YSCRGBColor(67, 67, 67);
        label.width = 200;
        label.x = YSCTopicCellMargin;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    self.label.text = title;
}

@end
