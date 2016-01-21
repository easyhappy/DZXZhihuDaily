//
//  ArticleDetailModel.m
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/21.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ArticleDetailModel.h"

@implementation ArticleDetailModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.body = [dict objectForKey:@"body"];
        self.image_source = [dict objectForKey:@"image_source"];
        self.title = [dict objectForKey:@"title"];
        self.image = [dict objectForKey:@"image"];
        self.share_url = [dict objectForKey:@"share_url"];
        self.js = [dict objectForKey:@"js"];
        self.ga_prefix = [dict objectForKey:@"ga_prefix"];
        
        NSNumber *type = [dict objectForKey:@"type"];
        self.type = [NSString stringWithFormat:@"%@",type];
        
        NSNumber *articleID = [dict objectForKey:@"id"];
        self.articleID = [NSString stringWithFormat:@"%@",articleID];
        
        self.css = [dict objectForKey:@"css"][0];
    }
    
    return self;
}

@end
