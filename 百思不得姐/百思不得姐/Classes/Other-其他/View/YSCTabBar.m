//
//  YSCTabBar.m
//  百思不得姐练习1
//
//  Created by 杨世超 on 16/3/19.
//  Copyright © 2016年 杨世超. All rights reserved.
//

#import "YSCTabBar.h"
#import "YSCPublishViewController.h"
#import "YSCPostWordViewController.h"
#import "YSCNavigationController.h"

@interface YSCTabBar()

/** 发布按钮*/
//self的属性  self.
@property (nonatomic,weak) UIButton *publishButton;

@end

@implementation YSCTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton = publishButton; //添加之后调用 layoutSubviews，调整尺寸
    }
    return self;
}

- (void)publishClick
{
    YSCPublishViewController *publish = [[YSCPublishViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publish animated:NO completion:nil];
//    [YSCPublishView show];
    
//    YSCPostWordViewController *postWord = [[YSCPostWordViewController alloc] init];
//    YSCNavigationController *nav = [[YSCNavigationController alloc] initWithRootViewController:postWord];
//    
//    // 这里不能使用self来弹出其他控制器, 因为self执行了dismiss操作
//    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
//    [root presentViewController:nav animated:YES completion:nil];

    
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    // 标记按钮是否已经添加过监听器
    static BOOL added = NO;
    
    //设置发布按钮
//    self.publishButton.bounds = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    //中心点需要计算，size 初始化的时候设置一次就可以了
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(self.width *0.5, self.height * 0.5);
    CGFloat buttonY = 0;
    CGFloat buttonW = self.width / 5;
    CGFloat buttonH = self.height;
    NSInteger index = 0;
    for (UIControl *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index );
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
        
        if (added == NO) {
            // 监听按钮点击
            [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)buttonClick
{
    // 发出一个通知
    [YSCNoteCenter postNotificationName:YSCTabBarDidSelectNotification object:nil userInfo:nil];
}
@end
