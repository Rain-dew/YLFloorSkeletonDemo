//
//  SNFHomeBannerTableViewCell.m
//  SNYifubao
//
//  Created by zsl on 2018/5/28.
//  Copyright © 2018年 Suning. All rights reserved.
//

#import "SNFFindHomeBannerCell.h"
@interface SNFFindHomeBannerCell ()
@property(nonatomic, strong) NSArray *models;

@end
@implementation SNFFindHomeBannerCell
- (void)initSubView

{
    
}

- (void)bindModel:(id)model
{
    
    if (model && [model isKindOfClass:[NSArray class]]) {
        self.models = model;
        if ([self.models.firstObject isKindOfClass:[SNFFindHomeBannerData class]]) {
        }
    }
}
- (void)tapAdViewWithIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemWithLink:)]) {
        SNFFindHomeBannerData *bannerModel = self.models[index];
        [self.delegate didSelectedItemWithLink:bannerModel.url];

    }
}


+ (CGFloat)cellHeight:(id)model
{
    return 80 * kScaleX;
}

@end
