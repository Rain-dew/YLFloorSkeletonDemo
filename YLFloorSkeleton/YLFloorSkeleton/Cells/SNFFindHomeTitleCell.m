//
//  SNFFindHomeTitleCell.m
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/10.
//  Copyright © 2019 Suning. All rights reserved.
//

#import "SNFFindHomeTitleCell.h"

@interface SNFFindHomeTitleCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) SNFFindHomeItemData *itemData;

@end

@implementation SNFFindHomeTitleCell

- (void)initSubView
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = kHexColor(0x333333);
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.width.mas_lessThanOrEqualTo(150);
        make.height.mas_equalTo(18);
    }];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton.hidden = YES;
    [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
    [_moreButton setTitleColor:kHexColor(0x333333) forState:UIControlStateNormal];
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_moreButton setImage:[UIImage imageNamed:@"snffind_title_arrow"] forState:UIControlStateNormal];
    _moreButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 30);
    _moreButton.imageEdgeInsets = UIEdgeInsetsMake(0, 45, 0, -5);
    [_moreButton addTarget:self action:@selector(moreButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_moreButton];
    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(self.contentView);
    }];
}

- (void)bindModel:(id)model
{
    if (!model || ![model isKindOfClass:[SNFFindHomeItemData class]]) {
        return;
    }
    self.itemData = (SNFFindHomeItemData *)model;
    self.titleLabel.text = kIsStrEmpty(self.itemData.name) ? @"" : self.itemData.name;
    self.moreButton.hidden = kIsStrEmpty(self.itemData.nameMarkUrl);
}

- (void)moreButtonAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemWithLink:)]) {
        [self.delegate didSelectedItemWithLink:self.itemData.nameMarkUrl];
    }
}

+ (CGFloat)cellHeight:(id)model
{
    return 30;
}

@end
