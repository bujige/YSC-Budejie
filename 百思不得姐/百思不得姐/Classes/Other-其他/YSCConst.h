
#import <UIKit/UIKit.h>

typedef enum {
    YSCTopicTypeAll = 1,
    YSCTopicTypePicture = 10,
    YSCTopicTypeWord = 29,
    YSCTopicTypeVoice = 31,
    YSCTopicTypeVideo = 41
} YSCTopicType;

/** 精华-顶部标题的高度 */
UIKIT_EXTERN CGFloat const YSCTitilesViewH;
/** 精华-顶部标题的Y */
UIKIT_EXTERN CGFloat const YSCTitilesViewY;


/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const YSCTopicCellMargin;
/** 精华-cell-文字内容的Y值 */
UIKIT_EXTERN CGFloat const YSCTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const YSCTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const YSCTopicCellPictureMaxH;
/** 精华-cell-图片帖子一旦超过最大高度,就是用Break */
UIKIT_EXTERN CGFloat const YSCTopicCellPictureBreakH;

/** XMGUser模型-性别属性值 */
UIKIT_EXTERN NSString * const YSCUserSexMale;
UIKIT_EXTERN NSString * const YSCUserSexFemale;

/** 精华-cell-最热评论标题的高度 */
UIKIT_EXTERN CGFloat const YSCTopicCellTopCmtTitleH;

/** tabBar被选中的通知名字 */
UIKIT_EXTERN NSString * const YSCTabBarDidSelectNotification;
/** tabBar被选中的通知 - 被选中的控制器的index key */
UIKIT_EXTERN NSString * const YSCSelectedControllerIndexKey;
/** tabBar被选中的通知 - 被选中的控制器 key */
UIKIT_EXTERN NSString * const YSCSelectedControllerKey;

/** 标签-间距 */
UIKIT_EXTERN CGFloat const YSCTagMargin;
/** 标签-高度 */
UIKIT_EXTERN CGFloat const YSCTagH;
