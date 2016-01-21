//
//  ArticleListModel.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/7.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleListModel : NSObject

//文章列表
@property (copy, nonatomic) NSString *date; //日期
@property (copy, nonatomic) NSString *title; //新闻标题
@property (copy, nonatomic) NSString *images; //单元格小图
@property (copy, nonatomic) NSString *ga_prefix; //供 Google Analytics 使用
@property (copy, nonatomic) NSString *type; //状态（暂时没用）
@property (copy, nonatomic) NSString *articleID; //文章id
@property (assign, nonatomic) BOOL isMultipic; //文章是否包含多张图片（在文章列表单元格的小图右下角显示）

@property (strong, nonatomic) ArticleListModel *model;
@property (strong, nonatomic) NSArray *articleList; //存储文章数组

- (instancetype)initWithArray:(NSArray *)array;


@end
