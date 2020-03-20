//
//  ViewController.m
//  YLFloorSkeleton
//
//  Created by 张雨露 on 2020/1/8.
//  Copyright © 2020 Raindew. All rights reserved.
//

#import "ViewController.h"
#import "FSFloorDataSource.h"
#import "SNFFindHomeService.h"
#import "SNFFindHomeBaseCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SNFFindHomeCellTapDelegate>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FSFloorDataSource *myDataSource;
@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic, strong) NSDictionary *cellIdentifierDic;
@property (nonatomic, strong) NSMutableDictionary *dataSourceDic;
@end

@implementation ViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight-kNavigationBarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.tableFooterView = [UIView new];
        [_cellIdentifierDic.allValues enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
          [_tableView registerClass:NSClassFromString(obj) forCellReuseIdentifier:obj];
       }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"框架演示";
    [self initData];
    [self requestHomeData];
    [self.view addSubview:self.tableView];
    
}

#pragma mark -- Data & UI
- (void)initData {

    self.myDataSource = [[FSFloorDataSource alloc] init];
    self.sectionArray = @[@(SNFFindHomeSectionTypeUserInfo),
                          @(SNFFindHomeSectionTypeCreditMarket),
                          @(SNFFindHomeSectionTypeTopic),
                          @(SNFFindHomeSectionTypeActivityList),
                          @(SNFFindHomeSectionTypeInstalmentStore)];

    self.cellIdentifierDic = @{
                               @(SNFFindHomeCellTypeIcon) : @"SNFFindHomeIconCell",
                               @(SNFFindHomeCellTypeBanner) : @"SNFFindHomeBannerCell",
                               @(SNFFindHomeCellTypeActivity) : @"SNFFindHomeActivityCell",
                               @(SNFFindHomeCellTypeSeparator): @"SNFFindHomeSeparatorCell",
                               @(SNFFindHomeCellTypeTitle) : @"SNFFindHomeTitleCell",
                               }.copy;
    self.dataSourceDic = [[NSMutableDictionary alloc] init];

}

- (void)requestHomeData {
    __weak typeof(self) weakSelf = self;
    //获取楼层数据
    [SNFFindHomeService fetchFindHomeFloorDataWithSuccess:^(NSArray<SNFFindHomeItemData *> *allData, NSArray<SNFFindHomeIconData *> *iconModels, NSArray<SNFFindHomeBannerData *> *bannerModels, NSArray<SNFFindHomeActivityItemData *> *activityModels) {
         __strong typeof(weakSelf) strongSelf = weakSelf;
//        strongSelf.homeBaseData = allData;

        [strongSelf.myDataSource constuctIconDataSource:iconModels];
        [strongSelf.myDataSource constuctBannerDataSource:bannerModels];
        strongSelf.dataSourceDic[@(SNFFindHomeSectionTypeUserInfo)] = strongSelf.myDataSource.oneSectionDataSourceArray;
        
        //活动中心
//        SNFFindHomeItemData *activityData = [strongSelf fetchHomeItemDataInHomeDataWithKey:@"activitis"];
        [strongSelf.myDataSource constuctActivityDataSource:activityModels titleData:nil];
        strongSelf.dataSourceDic[@(SNFFindHomeSectionTypeActivityList)] = strongSelf.myDataSource.twoSectionDataSourceArray;
                
    //分期商城
    //        SNFFindHomeItemData *instalmentAllData = [strongSelf fetchHomeItemDataInHomeDataWithKey:@"fqMall"];
    //        SNFFindHomeInstalmentData *instalmentData = [[SNFFindHomeInstalmentData alloc] init];
    //        instalmentData.instalmentArray = instalmentModels;
    //        [strongSelf.myDataSource constuctInstalmentStoreDataSource:instalmentData titleData:instalmentAllData];
    //        strongSelf.dataSourceDic[@(SNFFindHomeSectionTypeInstalmentStore)] = strongSelf.myDataSource.instalmentDataSourceArray;

        [strongSelf.tableView reloadData];
    } failure:^(NSString *statusCode, NSString *error) {
        
    }];
    
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SNFFindHomeSectionType type = [self.sectionArray[section] integerValue];
    NSArray *sectionData = self.dataSourceDic[@(type)];
    if (!sectionData) {
        return 0;
    }
    return [sectionData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SNFFindHomeDataSourceModel *dsModel = [self dataSourceItemAtSection:indexPath.section row:indexPath.row];
    if (!dsModel) {
        return [UITableViewCell new];
    }
    UITableViewCell *cell;
    NSString *cellClassName = self.cellIdentifierDic[@(dsModel.cellType)];
    if (kIsStrEmpty(cellClassName)) {
        return [UITableViewCell new];
    }
    SNFFindHomeBaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:cellClassName forIndexPath:indexPath];
    baseCell.delegate = self;
    [baseCell bindModel:dsModel.model];
    cell = baseCell;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SNFFindHomeDataSourceModel *dsModel = [self dataSourceItemAtSection:indexPath.section row:indexPath.row];
    if (!dsModel) {
        return 0.0;
    }
    return dsModel.cellHeight;
}
#pragma mark -- Private Method
- (id)dataSourceItemAtSection:(NSInteger)section row:(NSInteger)row {
    NSArray *sectionData = self.dataSourceDic[self.sectionArray[section]];
    if (!sectionData) {
        return nil;
    }
    return (row < [sectionData count]) ? sectionData[row] : nil;
}

- (void)didSelectedItemWithLink:(NSString *)link {
    
}

@end
