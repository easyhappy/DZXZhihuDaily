//
//  TopArticleModel.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/9.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopArticleModel : NSObject

//滚动文章
@property (copy, nonatomic) NSString *top_title; //顶部滚动文章标题
@property (copy, nonatomic) NSString *top_image; //顶部滚动文章图片
@property (copy, nonatomic) NSString *top_ga_prefix; //供 Google Analytics 使用
@property (copy, nonatomic) NSString *top_type; //状态
@property (copy, nonatomic) NSString *top_articleID; //顶部滚动文章id

@property (strong, nonatomic) TopArticleModel *model;
@property (strong, nonatomic) NSArray *topArticleList;

- (instancetype)initWithArray:(NSArray *)array;

@end
