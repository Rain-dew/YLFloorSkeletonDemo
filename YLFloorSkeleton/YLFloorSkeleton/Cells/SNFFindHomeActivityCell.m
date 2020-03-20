//
//  SNFFindHomeActivityCell.m
//  SNYifubao
//
//  Created by 张雨露 on 2019/10/10.
//  Copyright © 2019 Raindew. All rights reserved.
//

#import "SNFFindHomeActivityCell.h"

@interface SNFFindHomeActivityCell ()

@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIImageView *activityImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation SNFFindHomeActivityCell

- (void)initSubView
{
    _baseView = [[UIView alloc] init];
    _baseView.backgroundColor = [UIColor whiteColor];

    [self.contentView addSubview:_baseView];
    UIEdgeInsets edge = UIEdgeInsetsMake(15, 15, 15, 15);
    [_baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).mas_offset(edge);
    }];
    
    _activityImageView = [[UIImageView alloc] init];
    _activityImageView.layer.cornerRadius = 4;
    _activityImageView.layer.masksToBounds = YES;
    [_baseView addSubview:_activityImageView];
    [_activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(90 * kScaleX);
        make.left.mas_equalTo(_baseView).offset(0);
        make.width.mas_equalTo(140 * kScaleX);
        make.top.mas_equalTo(_baseView).offset(0);
    }];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = kHexColor(0x000000);
    UIFont *titleFont = [UIFont fontWithName:@"PingFangSC-Medium" size:14 * kScaleX];
    if (!titleFont) {
        titleFont = [UIFont boldSystemFontOfSize:14 * kScaleX];
    }
    _titleLabel.font = titleFont;
    _titleLabel.numberOfLines = 2;
    _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [_baseView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_baseView).offset(0);
        make.left.mas_equalTo(_activityImageView.mas_right).offset(10);
        make.right.mas_equalTo(_baseView).offset(0);
        make.height.mas_equalTo(40 * kScaleX);
    }];
    
    _descLabel = [[UILabel alloc] init];
    _descLabel.textColor = kHexColor(0x333333);
    UIFont *descFont = [UIFont fontWithName:@"PingFangSC-Regular" size:(12 * kScaleX)];
    if (!descFont) {
        descFont = [UIFont boldSystemFontOfSize:12 * kScaleX];
    }
    _descLabel.font = descFont;
    _descLabel.textAlignment = NSTextAlignmentLeft;
    [_baseView addSubview:_descLabel];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(0);
        make.left.mas_equalTo(_activityImageView.mas_right).offset(10);
        make.right.mas_equalTo(_baseView).offset(0);
        make.height.mas_equalTo(25 * kScaleX);
    }];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textColor = kHexColor(0x999999);
    UIFont *timeFont = [UIFont fontWithName:@"PingFangSC-Regular" size:(12 * kScaleX)];
    if (!timeFont) {
        timeFont = [UIFont boldSystemFontOfSize:12 * kScaleX];
    }
    _timeLabel.font = timeFont;
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    [_baseView addSubview:_timeLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(_descLabel.mas_bottom).offset(0);
       make.right.mas_equalTo(_baseView).offset(0);
       make.left.mas_equalTo(_activityImageView.mas_right).offset(10);
       make.height.mas_equalTo(25 * kScaleX);
    }];
    
}

- (void)bindModel:(id)model
{
    if (!model) {
        return;
    }
    if ([model isKindOfClass:[SNFFindHomeActivityItemData class]]) {
        self.baseView.hidden = NO;
        SNFFindHomeActivityItemData *itemData = (SNFFindHomeActivityItemData *)model;
        [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:kIsStrEmpty(itemData.imgUrl) ? @"" : itemData.imgUrl] placeholderImage:[UIImage imageNamed:@"snffind_activity_placeholder"]];
        self.titleLabel.text = kIsStrEmpty(itemData.name) ? @"" : itemData.name;
        self.descLabel.text = kIsStrEmpty(itemData.subName) ? @"" : itemData.subName;
        self.timeLabel.text = kIsStrEmpty(itemData.value) ? @"" : itemData.value;
    }
}


+ (CGFloat)cellHeight:(id)model
{
    return 90 * kScaleX + 30;
}

@end
