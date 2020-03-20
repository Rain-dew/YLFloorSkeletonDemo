//
//  SNFFindHomeData.h
//  SNYifubao
//
//  Created by 赵建磊 on 2019/10/9.
//  Copyright © 2019 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNFFindHomeItemData : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nameMarkUrl;
@property (nonatomic, copy) NSString *showMore;//标记datas里面的数据是不是还有更多
@property (nonatomic, strong) NSArray *datas;

@end


//icon
@interface SNFFindHomeIconData : NSObject
@property(nonatomic, copy)NSString *key;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *imgUrl;
@property(nonatomic, copy)NSString *url;
@end


//banner
@interface SNFFindHomeBannerData : NSObject
@property(nonatomic, copy)NSString *position;
@property(nonatomic, copy)NSString *key;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *imgUrl;
@property(nonatomic, copy)NSString *url;
@end

@interface SNFFindHomeActivityListItemData : NSObject
@property (nonatomic, copy) NSString *activityId;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *effDate;
@property (nonatomic, copy) NSString *expDate;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@end

@interface SNFFindHomeActivityItemData : NSObject
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *subName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *value; //存的是时间
@property (nonatomic, copy) NSString *cgCode; //客户群编码
@property (nonatomic, copy) NSString *key; //id
@end


