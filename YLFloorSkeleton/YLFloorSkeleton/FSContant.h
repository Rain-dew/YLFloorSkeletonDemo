//
//  FSContant.h
//  YLFloorSkeleton
//
//  Created by 张雨露 on 2020/1/8.
//  Copyright © 2020 Raindew. All rights reserved.
//

#ifndef FSContant_h
#define FSContant_h

//屏幕尺寸相关
#define kScreen         [UIScreen mainScreen].bounds
#define kScreenHeight   kScreen.size.height
#define kScreenWidth    kScreen.size.width
#define kRandomColor    kRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

// 状态栏高度
#define kStatusBarHeight         [[UIApplication sharedApplication] statusBarFrame].size.height
// 导航栏高度
#define kNavigationBarHeight     (kStatusBarHeight + 44)
#define kIs_iPhoneX kScreenWidth >=375.0f && kScreenHeight >=812.0f

/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?83:49)
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?34:0)
#define kScaleY         kScreenHeight/667.f//以6s高度为基准1
#define kScaleX         kScreenWidth/375.f//以6s宽度为基准1

#define kFormat(f, ...) [NSString stringWithFormat:f, ## __VA_ARGS__]

#define kImage(name) [UIImage imageNamed:name]

#define kURL(name) [NSURL URLWithString:name]

#define kNIB(name) [UINib nibWithNibName:name bundle:nil]

#define kHexColor(hexValue) [UIColor colorWithRed:((float)((hexValue &0xFF0000) >>16))/255.0 green:((float)((hexValue &0xFF00) >>8))/255.0  blue:((float)(hexValue &0xFF))/255.0 alpha:1.0]

//空值判断
#define kIsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([@"" isEqualToString:(_ref)]))
#define kIsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

 // view圆角
#define kViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#endif /* FSContant_h */
