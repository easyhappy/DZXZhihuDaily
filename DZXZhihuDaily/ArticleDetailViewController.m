//
//  ArticleDetailViewController.m
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/19.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "ArticleDetailModel.h"
#import "DZXHttpRequest.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface ArticleDetailViewController ()

@end

@implementation ArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTopView];
    [self getArticleDetailData];
    
    NSURL *url = [NSURL URLWithString:@"https://www.zhihu.com"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.navigationView.hidden = YES;
    self.webView.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
//创建顶部可拉伸图片视图
- (void)createTopView {
    //webView上方留出空间存放topView
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
    
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -50, SCREEN_WIDTH, 260)];
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    
    [self.webView.scrollView addSubview:self.topView];
    [self.topView addSubview:self.imageScrollView];
    [self.imageScrollView addSubview:self.topImageView];
}

#pragma mark - HTTP request
- (void)getArticleDetailData {
    NSString *url = [DETAILCONTENT_URL stringByAppendingString:self.articleID];
    [DZXHttpRequest getDataWithURL:url
                         parameter:nil
                           success:^(id responseDict) {
                               self.articleDetailModel = [[ArticleDetailModel alloc] initWithDict:responseDict];
                               [self.topImageView sd_setImageWithURL:[NSURL URLWithString:self.articleDetailModel.image]
                                                    placeholderImage:[UIImage imageNamed:@"Home_Image"]];
                               NSString *htmlString = [self getHTMLStringWithBody:self.articleDetailModel.body CSS:self.articleDetailModel.css];
                               [self.webView loadHTMLString:htmlString baseURL:nil];
                               
                           } fail:^(NSError *error) {
                           }];
}

#pragma mark - WebView SrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.webView.scrollView) {
        CGFloat offsetY = self.webView.scrollView.contentOffset.y;
        if (offsetY <= 0 && offsetY >= -100) {
            self.imageScrollView.frame = CGRectMake(0, -50 + offsetY / 2, SCREEN_WIDTH, 260 - offsetY / 2);
        }
        else if (offsetY < -100) {
            [self.webView.scrollView setContentOffset:CGPointMake(0, -100)];
        }
    }
}

#pragma mark - HTML String
- (NSString *)getHTMLStringWithBody:(NSString *)body CSS:(NSString *)css {
    return [NSString stringWithFormat:@"<head><meta charset=%@><link rel=%@ type=%@ href=%@/></head><body>%@</body></html>",@"utf-8",@"stylesheet",@"text/css",css,body];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
