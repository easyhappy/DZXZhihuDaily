//
//  ArticleListModel.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/7.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ArticleListModel.h"

@implementation ArticleListModel

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    
    if (self) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dict in array) {
            ArticleListModel *model = [[ArticleListModel alloc] initWithDict:dict];
            [list addObject:model];
        }
        
        self.articleList = list;
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.title = [dict objectForKey:@"title"];
        self.ga_prefix = [dict objectForKey:@"ga_prefix"];
        self.images = [dict objectForKey:@"images"][0];
        self.isMultipic = [dict objectForKey:@"multipic"];
        
        NSNumber *type = [dict objectForKey:@"type"];
        self.type = [NSString stringWithFormat:@"%@",type];
        
        NSNumber *articleID = [dict objectForKey:@"id"];
        self.articleID = [NSString stringWithFormat:@"%@",articleID];
    }
    return self;
}

@end
