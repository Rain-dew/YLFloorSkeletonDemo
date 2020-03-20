//
//  SNFFindHomeService.h
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNFFindHomeActivityData;

#import "SNFFindHomeData.h"

@interface SNFFindHomeService : NSObject

//获取楼层数据
+ (void)fetchFindHomeFloorDataWithSuccess:(void (^)(NSArray<SNFFindHomeItemData *> *allData,NSArray<SNFFindHomeIconData *> *iconModels,NSArray<SNFFindHomeBannerData *> *bannerModels,NSArray<SNFFindHomeActivityItemData *>*activityModels))success failure:(void (^)(NSString * statusCode, NSString * error))failureBlock;


@end
