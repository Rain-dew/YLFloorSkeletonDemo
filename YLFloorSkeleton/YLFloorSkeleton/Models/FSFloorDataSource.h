//
//  FSFloorDataSource.h
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNFFindHomeData.h"
typedef NS_ENUM(NSUInteger, SNFFindHomeSectionType) {
    SNFFindHomeSectionTypeUserInfo,
    SNFFindHomeSectionTypeCreditMarket,
    SNFFindHomeSectionTypeTopic,
    SNFFindHomeSectionTypeActivityList,
    SNFFindHomeSectionTypeInstalmentStore,
};

typedef NS_ENUM(NSUInteger, SNFFindHomeCellType) {
    SNFFindHomeCellTypeIcon,
    SNFFindHomeCellTypeBanner,
    SNFFindHomeCellTypeTitle,
    SNFFindHomeCellTypeActivity,
    SNFFindHomeCellTypeSeparator,
};

@interface SNFFindHomeDataSourceModel : NSObject

@property (nonatomic, assign) SNFFindHomeCellType cellType;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) id model;

- (instancetype)initWithType:(SNFFindHomeCellType)type model:(id)model;

@end

@class SNFFindHomeActivityData;

@interface FSFloorDataSource : NSObject

@property (nonatomic, strong) NSMutableArray *oneSectionDataSourceArray;

@property (nonatomic, strong) NSMutableArray *twoSectionDataSourceArray;

@property (nonatomic, strong) NSMutableArray *threeSectionDataSourceArray;

//icon
- (void)constuctIconDataSource:(NSArray <SNFFindHomeIconData *>*)iconDatas;
//banner广告
- (void)constuctBannerDataSource:(NSArray <SNFFindHomeBannerData *>*)bannerDatas;

- (void)constuctActivityDataSource:(NSArray<SNFFindHomeActivityItemData *>*)activityList titleData:(SNFFindHomeItemData *)activityData;

- (void)removeAllDataSourceArray;

- (CGFloat)fetchSectionOriginY:(NSInteger)section;

@end

