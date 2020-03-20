//
//  UIButton+YLButton.h
//  QQ : 896525689
//
//  Created by Yulu Zhang on 15/10/12.
//  Copyright (c) 2015年 Yulu Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
typedef NS_ENUM(NSUInteger, YLButtonEdgeInsetsStyle) {
    YLButtonEdgeInsetsStyleTop, // image在上，title在下
    YLButtonEdgeInsetsStyleLeft, // image在左，title在右
    YLButtonEdgeInsetsStyleBottom, // image在下，title在上
    YLButtonEdgeInsetsStyleRight // image在右，title在左
};
typedef void(^TapBlock) (UIButton *sender);
@interface UIButton (YLButton)
/**
 *  button的边角美化
 */
- (void)yl_setButtonBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius;
/**
 *  button的点击事件转block
 */
-(void)yl_setButtonTapWithEvent:(UIControlEvents )controlEvent withBlock:(TapBlock)tapBlock;


/** (按钮初始化后调用)
 *  设置默认背景图和点击后的高亮图
 */
-(void)yl_setButtonBackgroudImageName:(NSString *)imageName andHighlightImageName:(NSString *)hImageName;

/*  设置图片的默认背景色和选择后背景色
 *
 */
-(void)yl_setButtonBackgourdNormalColor:(UIColor *)color andSelectedColor:(UIColor *)color;

/*  调整按钮标题和图片的位置
 *  style 样式风格
 *  space 图片和标题的距离
 */
- (void)yl_setButtonTitleAndImageEdgeInsetsWithStyle:(YLButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end
