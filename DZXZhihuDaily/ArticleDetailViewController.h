//
//  ArticleDetailViewController.h
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/19.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

@class ArticleDetailModel;

@interface ArticleDetailViewController : DZXViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIView *topView; //顶部空间容器
@property (strong, nonatomic) UIScrollView *imageScrollView; //图片拉伸容器
@property (strong, nonatomic) UIImageView *topImageView; //顶部图片

@property (strong, nonatomic) NSString *articleID; //加载文章的ID

@property (strong, nonatomic) ArticleDetailModel *articleDetailModel;

@end
