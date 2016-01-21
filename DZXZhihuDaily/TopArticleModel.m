//
//  TopArticleModel.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/9.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "TopArticleModel.h"

@implementation TopArticleModel

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    
    if (self) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in array) {
            TopArticleModel *model = [[TopArticleModel alloc] initWithDict:dict];
            [list addObject:model];
        }
        
        self.topArticleList = list;
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.top_title = [dict objectForKey:@"title"];
        self.top_image = [dict objectForKey:@"image"];
        self.top_ga_prefix = [dict objectForKey:@"ga_prefix"];
        
        NSNumber *top_type = [dict objectForKey:@"type"];
        self.top_type = [NSString stringWithFormat:@"%@",top_type];
        
        NSNumber *top_articleID = [dict objectForKey:@"id"];
        self.top_articleID = [NSString stringWithFormat:@"%@",top_articleID];
    }
    return self;
}

@end
