//
//  SectionModel.h
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/19.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (copy, nonatomic) NSString *sectionTitleText; //分组标题
@property (copy, nonatomic) NSArray *sectionDataSource; //分组数据

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
