//
//  SNFFindHomeBaseCell.m
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import "SNFFindHomeBaseCell.h"

@implementation SNFFindHomeBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    
}

- (void)bindModel:(id)model
{
    
}

+ (CGFloat)cellHeight:(id)model
{
    return 0.0;
}

@end

@implementation SNFFindHomeSeparatorCell

- (void)initSubView
{
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)bindModel:(id)model
{
    
}

+ (CGFloat)cellHeight:(id)model
{
    return 10.0f;
}

@end
