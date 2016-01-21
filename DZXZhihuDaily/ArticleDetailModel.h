//
//  ArticleDetailModel.h
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/21.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleDetailModel : NSObject

@property (copy, nonatomic) NSString *body; //文章body
@property (copy, nonatomic) NSString *image_source; //图片版权声明
@property (copy, nonatomic) NSString *title; //文章标题
@property (copy, nonatomic) NSString *image; //图片url地址
@property (copy, nonatomic) NSString *share_url; //文章分享地址
@property (copy, nonatomic) NSString *js; //文章js(一般没有)
@property (copy, nonatomic) NSString *ga_prefix;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *articleID;
@property (copy, nonatomic) NSString *css; //文章css

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
