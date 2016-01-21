//
//  ListViewController.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/4.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ListViewController.h"
#import "ArticleCustomTableViewCell.h"
#import "DZXHttpRequest.h"
#import "ArticleListModel.h"
#import "TopArticleModel.h"
#import "SectionModel.h"
#import "ArticleDetailViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationTitleAndBarButtonItem];
    [self createBanner];
    [self getLatestArticleData];
    
    [self.bannerScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    self.bannerScrollView.delegate = self;
    self.articleTableView.delegate = self;
    self.navigationAlpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
- (void)setNavigationTitleAndBarButtonItem {
    self.navigationTitleText = @"今日热闻";
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 26, 19, 19)];
    [menuButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateNormal];
    [menuButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateHighlighted];
    [menuButton addTarget:self
                   action:@selector(sendMessageToShowMenu)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
}

#pragma mark - Banner
- (void)createBanner {
    _bannerScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 7, 0);
    
    for (NSInteger i = 0; i < 7; i ++) {
        _bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
        _bannerImageView.image = [UIImage imageNamed:@"Home_Image"];
        
        [_bannerScrollView addSubview:_bannerImageView];
    }
}

- (void)createBannerTitleLabel {
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 3;
    label.font = [UIFont boldSystemFontOfSize:21.0];
    label.textColor = [UIColor whiteColor];
}

- (void)loadBannerData {
    for (NSInteger i = 0; i < 7; i ++) {
        _bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
        
        if (i == 0) {
            TopArticleModel *model = _topArticleList[4];
            [_bannerImageView sd_setImageWithURL:[NSURL URLWithString:model.top_image]
                                placeholderImage:[UIImage imageNamed:@"Home_Image"]];
        }
        else if (i == 6) {
            TopArticleModel *model = _topArticleList[0];
            [_bannerImageView sd_setImageWithURL:[NSURL URLWithString:model.top_image]
                                placeholderImage:[UIImage imageNamed:@"Home_Image"]];
        }
        else {
            TopArticleModel *model = _topArticleList[i - 1];
            [_bannerImageView sd_setImageWithURL:[NSURL URLWithString:model.top_image]
                                placeholderImage:[UIImage imageNamed:@"Home_Image"]];
        }
        
        [_bannerScrollView addSubview:_bannerImageView];
    }
}

#pragma mark - HTTP request
//获取最新消息
- (void)getLatestArticleData {
    [DZXHttpRequest getDataWithURL:LATEST_URL
                         parameter:nil
                           success:^(id responseDict) {
                               self.sectionModel = [[SectionModel alloc] initWithDict:responseDict];
                               self.articleSectionList = [[NSMutableArray alloc] init];
                               [self.articleSectionList addObject:self.sectionModel];
                               
                               TopArticleModel *topModel = [[TopArticleModel alloc] initWithArray:[responseDict objectForKey:@"top_stories"]];
                               self.topArticleList = topModel.topArticleList;
                               
                               //在获取数据后异步刷新tableView
                               [self tableViewReloadDataDispatchAsync];
                               //加载Banner数据
                               [self loadBannerData];
                               //获取最新日期
                               self.date = [responseDict objectForKey:@"date"];
                               
                           } fail:^(NSError *error) {
                           }];
}

//获取以往消息
- (void)getBeforeArticleData {
    _isLoading = YES; //正在加载
    NSString *completeURL = [BEFORECONTENT_URL stringByAppendingString:_date];
    [DZXHttpRequest getDataWithURL:completeURL
                         parameter:nil
                           success:^(id responseDict) {
                               self.sectionModel = [[SectionModel alloc] initWithDict:responseDict];
                               [self.articleSectionList addObject:self.sectionModel];
                               
                               _date = [responseDict objectForKey:@"date"];
                               
                               [self tableViewReloadDataDispatchAsync];
                               
                               _isLoading = NO; //加载完成
                           } fail:^(NSError *error) {
                           }];
}

#pragma mark - Post Notification
- (void)sendMessageToShowMenu {
    NSNotification *notice = [NSNotification notificationWithName:@"showMenu" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notice];
}

#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.articleTableView) {
        CGFloat offsetY = self.articleTableView.contentOffset.y; //tableview偏移量
        CGRect bounds = self.articleTableView.bounds;
        CGFloat height = self.articleTableView.contentSize.height;
        UIEdgeInsets inset = self.articleTableView.contentInset;
        float y = offsetY + bounds.size.height - inset.bottom;
        
        if (offsetY <= 0 && offsetY >= -100) {
            self.bannerScrollView.frame = CGRectMake(0, -50 + offsetY / 2, SCREEN_WIDTH, 260 - offsetY / 2);
            self.navigationAlpha = 0; //改变导航栏透明度
        }
        else if (offsetY < -100) {
            [self.articleTableView setContentOffset:CGPointMake(0, -100)];
        }
        else if (offsetY > 0) {
            //改变导航栏透明度
            self.navigationAlpha = offsetY / 156;
            self.bannerScrollView.frame = CGRectMake(0, -50 + offsetY / 2, SCREEN_WIDTH, 260 - offsetY / 2);
            /*------------判断是不是向下滑动------------*/
            if (offsetY > self.lastContentOffset.y && !_isLoading && y > height + 10) {
                [self getBeforeArticleData];
            }

            self.lastContentOffset = self.articleTableView.contentOffset;
            /*---------------------------------------*/
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = self.bannerScrollView.contentOffset.x / SCREEN_WIDTH;
    self.pageIndex.currentPage = offsetX - 1;
    if (offsetX == 0) {
        [self.bannerScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 5, 0) animated:NO];
        self.pageIndex.currentPage = 5;
    }
    else if (offsetX == 6) {
        [self.bannerScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
        self.pageIndex.currentPage = 0;
    }
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.articleSectionList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.sectionModel = self.articleSectionList[section];
    return self.sectionModel.sectionDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return 34;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    UIView *sectionHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34)];
    sectionHeader.backgroundColor = DEFAULT_NAVIGATIONCOLOR;
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:sectionHeader.bounds];

    SectionModel *sectionModel = [[SectionModel alloc] init];
    sectionModel = self.articleSectionList[section];
    dateLabel.text = sectionModel.sectionTitleText;
    
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    [sectionHeader addSubview:dateLabel];
    
    return sectionHeader;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ArticleCell";
    ArticleCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[ArticleCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:cellIdentifier];
    }
    
    SectionModel *sectionModel = [[SectionModel alloc] init];
    sectionModel = self.articleSectionList[indexPath.section];
    
    ArticleListModel *model = sectionModel.sectionDataSource[indexPath.row];
    
    [cell setCellWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
    ArticleDetailViewController *articleDetailView = [mainStoryboard instantiateViewControllerWithIdentifier:@"ArticleDetailView"];
    
    SectionModel *sectionModel = [[SectionModel alloc] init];
    sectionModel = self.articleSectionList[indexPath.section];
    
    ArticleListModel *model = sectionModel.sectionDataSource[indexPath.row];
    articleDetailView.articleID = model.articleID;
    
    [self.navigationController pushViewController:articleDetailView animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (section == 0) {
        [self.navigationView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 54)];
        self.navigationTitle.alpha = 1;
        [self.articleTableView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (section == 0) {
        [self.navigationView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        self.navigationTitle.alpha = 0;
        [self.articleTableView setFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20)];
        [self.articleTableView setContentOffset:CGPointMake(0, self.articleTableView.contentOffset.y + 20)];
    }
}

#pragma mark - Dispatch_async
- (void)tableViewReloadDataDispatchAsync {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.articleTableView reloadData];
        });
    });
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
