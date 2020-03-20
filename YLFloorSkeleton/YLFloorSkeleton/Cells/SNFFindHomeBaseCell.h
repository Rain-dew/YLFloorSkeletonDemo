//
//  SNFFindHomeBaseCell.h
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNFFindHomeData.h"

@protocol SNFFindHomeCellTapDelegate <NSObject>
/*统一的点击代理
 *  @param link : 点击链接
 */
- (void)didSelectedItemWithLink:(NSString *)link;

@end
@interface SNFFindHomeBaseCell : UITableViewCell
@property (nonatomic, weak) id<SNFFindHomeCellTapDelegate> delegate;

- (void)initSubView;

- (void)bindModel:(id)model;

+ (CGFloat)cellHeight:(id)model;

@end

@interface SNFFindHomeSeparatorCell : SNFFindHomeBaseCell

@end
