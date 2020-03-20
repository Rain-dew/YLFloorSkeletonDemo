//
//  SNFFindHomeService.m
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import "SNFFindHomeService.h"

@implementation SNFFindHomeService

+ (void)fetchFindHomeFloorDataWithSuccess:(void (^)(NSArray<SNFFindHomeItemData *> *allData,NSArray<SNFFindHomeIconData *> *iconModels,NSArray<SNFFindHomeBannerData *> *bannerModels,NSArray<SNFFindHomeActivityItemData *>*activityModels))success failure:(void (^)(NSString * statusCode, NSString * error))failureBlock {
 
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SNFFindHomeFloorData" ofType:@"json"]];
    NSDictionary *homeData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    [self dealFloorDataWithResponseObject:[homeData objectForKey:@"floor"] success:success];
}

+ (void)dealFloorDataWithResponseObject:(NSArray *)responseDatas success:(void (^)(NSArray<SNFFindHomeItemData *> *allData,NSArray<SNFFindHomeIconData *> *iconModels,NSArray<SNFFindHomeBannerData *> *bannerModels,NSArray<SNFFindHomeActivityItemData *>*activityModels))success {
    NSArray *models = [NSArray modelArrayWithClass:[SNFFindHomeItemData class] json:responseDatas];
    //icon
    NSArray <SNFFindHomeIconData *>*iconList = [NSArray array];
    //banner
    NSArray <SNFFindHomeBannerData *>*bannerList = [NSArray array];
    //activity
    NSArray <SNFFindHomeActivityItemData *>*activityList = [NSArray array];
    //instalment
//    NSArray <SNFFindHomeInstalmentItemData *>*instalmentList = [NSArray array];
    for (SNFFindHomeItemData *model in models) {
        if ([model.key isEqualToString:@"icon"] && model.datas.count > 0) {
            iconList = [NSArray modelArrayWithClass:[SNFFindHomeIconData class] json:model.datas];
        }else if ([model.key isEqualToString:@"adverts"] && model.datas.count > 0) {
            bannerList = [NSArray modelArrayWithClass:[SNFFindHomeBannerData class] json:model.datas];
        }else if ([model.key isEqualToString:@"activitis"] && model.datas.count > 0) {
            activityList = [NSArray modelArrayWithClass:[SNFFindHomeActivityItemData class] json:model.datas];
        }else if ([model.key isEqualToString:@"fqMall"] && model.datas.count > 0) {
//            instalmentList = [NSArray modelArrayWithClass:[SNFFindHomeInstalmentItemData class] json:model.datas];
        }
    }
    if (success) {
        success(models,iconList,bannerList,activityList);
    }
}

@end
