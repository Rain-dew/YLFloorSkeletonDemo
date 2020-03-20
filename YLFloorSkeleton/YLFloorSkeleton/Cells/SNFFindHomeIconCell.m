//
//  SNFFindHomeIconCell.m
//  SNYifubao
//
//  Created by 张雨露 on 2019/10/11.
//  Copyright © 2019 Suning. All rights reserved.
//

#import "SNFFindHomeIconCell.h"
#import "UIButton+YLButton.h"

@interface SNFFindHomeIconCell ()
@property(nonatomic, strong) NSMutableArray *btns;
@property(nonatomic, strong) NSArray *models;

@end
@implementation SNFFindHomeIconCell
- (void)initSubView
{
    self.backgroundColor = [UIColor whiteColor];
    self.btns = [NSMutableArray array];
    //固定4个
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(kScreenWidth/4), 0, kScreenWidth/4, 64*kScaleX);
        btn.tag = i;
        [btn addTarget:self action:@selector(didSelectItem:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth/4-(40*kScaleX))/2, 0, (40*kScaleX), (40*kScaleX))];
        imageView.tag = 111;
        [btn addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+6*kScaleX, CGRectGetWidth(btn.frame), 18*kScaleX)];
        titleLabel.tag = 222;
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.textColor = kHexColor(0x333333);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:titleLabel];
        
        [self.btns addObject:btn];
        [self.contentView addSubview:btn];
    }
}

- (void)didSelectItem:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemWithLink:)]) {
        SNFFindHomeIconData *iconModel = self.models[sender.tag];
        [self.delegate didSelectedItemWithLink:iconModel.url];
    }
}
- (void)bindModel:(id)model
{
    if (model && [model isKindOfClass:[NSArray class]]) {
        self.models = model;
        for (int i = 0; i < self.models.count; i++) {
            if ([self.models[i] isKindOfClass:[SNFFindHomeIconData class]]) {
                SNFFindHomeIconData *iconModel = self.models[i];
                if (i>3) {//只要4个
                    break;
                }
                UIButton *btn = self.btns[i];
                UIImageView *imageView = [btn viewWithTag:111];
                UILabel *titleLabel = [btn viewWithTag:222];
                titleLabel.text = iconModel.name;
                [imageView sd_setImageWithURL:[NSURL URLWithString:iconModel.imgUrl] placeholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"snffind_icon_%d",i]]];
            
            }
        }
       
    }
}

+ (CGFloat)cellHeight:(id)model
{
    return 64*kScaleX;
}

@end
