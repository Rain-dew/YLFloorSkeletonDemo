//
//  FSFloorDataSource.m
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import "FSFloorDataSource.h"
#import "SNFFindHomeData.h"

//cell
#import "SNFFindHomeIconCell.h"
#import "SNFFindHomeBannerCell.h"
#import "SNFFindHomeActivityCell.h"
#import "SNFFindHomeBaseCell.h"
#import "SNFFindHomeTitleCell.h"
@implementation SNFFindHomeDataSourceModel

- (instancetype)initWithType:(SNFFindHomeCellType)type model:(id)model
{
    if (self = [super init]) {
        self.cellType = type;
        self.model = model;
    }
    return self;
}

@end

@implementation FSFloorDataSource

- (id)init
{
    self = [super init];
    if (self) {
        _oneSectionDataSourceArray = [[NSMutableArray alloc] init];
        _twoSectionDataSourceArray = [[NSMutableArray alloc] init];
        _threeSectionDataSourceArray = [[NSMutableArray alloc] init];

    }
    return self;
}

- (void)constuctIconDataSource:(NSArray <SNFFindHomeIconData *>*)iconDatas {
    if (kIsArrEmpty(iconDatas) || iconDatas.count<4) {//小于4个不展示
        return;
    }
    SNFFindHomeDataSourceModel *dsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeIcon model:iconDatas];
    dsModel.cellHeight = [SNFFindHomeIconCell cellHeight:iconDatas];
    [self.oneSectionDataSourceArray addObject:dsModel];
    
    [self addSepCellWithNum:1 inArray:self.oneSectionDataSourceArray];
}

- (void)constuctBannerDataSource:(NSArray <SNFFindHomeBannerData *>*)bannerDatas {
    if (kIsArrEmpty(bannerDatas)) {
        return;
    }
    SNFFindHomeDataSourceModel *dsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeBanner model:bannerDatas];
    dsModel.cellHeight = [SNFFindHomeBannerCell cellHeight:bannerDatas];
    [self.oneSectionDataSourceArray addObject:dsModel];
    
    [self addSepCellWithNum:1 inArray:self.oneSectionDataSourceArray];
}

//分期商城
//- (void)constuctInstalmentStoreDataSource:(SNFFindHomeInstalmentData *)instalmentData titleData:(SNFFindHomeItemData *)itemData
//{
//    [self.instalmentDataSourceArray removeAllObjects];
//    if (SNFCL_IsNilOrNull(instalmentData.instalmentArray) || instalmentData.instalmentArray.count < 3) {
//        return;
//    }
//    SNFFindHomeDataSourceModel *titleDsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeTitle model:itemData];
//    titleDsModel.cellHeight = [SNFFindHomeTitleCell cellHeight:itemData];
//    [self.instalmentDataSourceArray addObject:titleDsModel];
//
//    SNFFindHomeDataSourceModel *dsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeInstalment model:instalmentData];
//    dsModel.cellHeight = [SNFFindHomeInstalmentCell cellHeight:nil];
//    [self.instalmentDataSourceArray addObject:dsModel];
//
//    [self addSepCellWithNum:1 inArray:self.instalmentDataSourceArray];
//}

- (void)constuctActivityDataSource:(NSArray<SNFFindHomeActivityItemData *>*)activityList titleData:(SNFFindHomeItemData *)activityData
{
    [self.twoSectionDataSourceArray removeAllObjects];
    if (kIsArrEmpty(activityList)) {
        return;
    }
    activityData.nameMarkUrl = [activityData.showMore isEqualToString:@"1"] ? @"activity_more" : @"";//固定值，为了非空判断。
    SNFFindHomeDataSourceModel *titleDsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeTitle model:activityData];
    titleDsModel.cellHeight = [SNFFindHomeTitleCell cellHeight:activityData];
    [self.twoSectionDataSourceArray addObject:titleDsModel];
    NSArray *aList = activityList;
    if (aList.count>3) {//取前3个
        aList = [activityList subarrayWithRange:NSMakeRange(0, 3)];
    }
    for (SNFFindHomeActivityItemData *model in aList) {
        SNFFindHomeDataSourceModel *dsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeActivity model:model];
        dsModel.cellHeight = [SNFFindHomeActivityCell cellHeight:model];
        [self.twoSectionDataSourceArray addObject:dsModel];
    }
}


- (void)addSepCellWithNum:(NSInteger)num inArray:(NSMutableArray *)array
{
    for (int i = 0; i<=num; i++) {
        SNFFindHomeDataSourceModel *sepDsModel = [[SNFFindHomeDataSourceModel alloc] initWithType:SNFFindHomeCellTypeSeparator model:nil];
        sepDsModel.cellHeight = [SNFFindHomeSeparatorCell cellHeight:nil];
        [array addObject:sepDsModel];
    }
}

- (void)removeAllDataSourceArray
{
    [self.oneSectionDataSourceArray removeAllObjects];
    [self.twoSectionDataSourceArray removeAllObjects];
    [self.threeSectionDataSourceArray removeAllObjects];

}

- (CGFloat)fetchSectionOriginY:(NSInteger)section
{
    NSMutableArray *dsArray = [NSMutableArray new];
    switch (section) {
        case 1:
            [dsArray addObjectsFromArray:self.oneSectionDataSourceArray];
            break;
        case 2:
            [dsArray addObjectsFromArray:self.oneSectionDataSourceArray];
            [dsArray addObjectsFromArray:self.twoSectionDataSourceArray];
            break;
        case 3:
            [dsArray addObjectsFromArray:self.oneSectionDataSourceArray];
            [dsArray addObjectsFromArray:self.twoSectionDataSourceArray];
            [dsArray addObjectsFromArray:self.threeSectionDataSourceArray];
            break;
        default:
            break;
    }

    __block CGFloat originY = 0;
    [dsArray enumerateObjectsUsingBlock:^(SNFFindHomeDataSourceModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        originY += obj.cellHeight;
    }];
    return originY;
}

@end
