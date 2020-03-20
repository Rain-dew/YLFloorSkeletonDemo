//
//  UIButton+YLButton.m
//  苗木--iOS
//
//  Created by Raindew on 15/10/12.
//  Copyright (c) 2015年 shuogao. All rights reserved.
//

#import "UIButton+YLButton.h"
static const void *BtnBlockKey = @"BtnBlockKey";
@implementation UIButton (YLButton)

/**
 *  button的边角美化
 *
 */
- (void)yl_setButtonBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
}
/**
 *  button的点击事件转block
 *
 */
-(void)yl_setButtonTapWithEvent:(UIControlEvents )controlEvent withBlock:(TapBlock )tapBlock {

    objc_setAssociatedObject(self, BtnBlockKey, tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)clickButton:(UIButton *)sender {
    TapBlock tapBlock = objc_getAssociatedObject(sender, BtnBlockKey);
    if (tapBlock) {
        tapBlock(sender);
    }
}



- (void)yl_setButtonBackgroudImageName:(NSString *)imageName andHighlightImageName:(NSString *)hImageName {
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

    [self setBackgroundImage:[UIImage imageNamed:hImageName] forState:UIControlStateHighlighted];

}

- (void)yl_setButtonBackgourdNormalColor:(UIColor *)normalColor andSelectedColor:(UIColor *)selectedColor {

    self.selected = !self.selected;
    
    if (self.selected) {
        
        [self setBackgroundColor:normalColor];
    }else {
        
        [self setBackgroundColor:selectedColor];
    }

}

//设置标题和图片样式

- (void)yl_setButtonTitleAndImageEdgeInsetsWithStyle:(YLButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space {
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    }else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case YLButtonEdgeInsetsStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case YLButtonEdgeInsetsStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case YLButtonEdgeInsetsStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case YLButtonEdgeInsetsStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}


@end
