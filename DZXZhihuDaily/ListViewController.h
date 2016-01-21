//
//  ListViewController.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/4.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

@class SectionModel;

@interface ListViewController : DZXViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

//存储数组
@property (strong, nonatomic) NSMutableArray *articleSectionList; //文章数组
@property (strong, nonatomic) NSArray *topArticleList; //顶部滚动文章数组

//控件
@property (strong, nonatomic) IBOutlet UITableView *articleTableView; //文章tableview
@property (strong, nonatomic) IBOutlet UIScrollView *bannerScrollView; //滚动视图
@property (strong, nonatomic) IBOutlet UIPageControl *pageIndex; //页数
@property (strong, nonatomic) UIImageView *bannerImageView; //滚动视图中的图片视图
@property (strong, nonatomic) UIImageView *maskImageView; //滚动图片上的阴影图片

//数值
@property (copy, nonatomic) NSString *date; //当前日期
@property (assign, nonatomic) CGPoint lastContentOffset; //上一次滑动坐标
@property (assign, readonly, nonatomic) BOOL isLoading; //判断是否还在加载
@property (copy, nonatomic) NSString *sectionTitleText; //分组标题

@property (strong, nonatomic) SectionModel *sectionModel;

@end
