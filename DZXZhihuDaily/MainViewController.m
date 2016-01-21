//
//  MainViewController.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/3.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;

    [self interfaceBasicSettings];
    [self registerObserverToShowMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
- (void)interfaceBasicSettings {
    self.navigationView.hidden = YES; //隐藏导航栏
    _scrollView.contentOffset = CGPointMake(_menuView.frame.size.width, 0); //默认隐藏菜单界面
}

#pragma mark - Menu
- (void)showMenu {
    [UIView animateWithDuration:0.25
                     animations:^{
                         _scrollView.contentOffset = CGPointMake(0, 0);
                     }];
}

- (void)hideMenu {
    [UIView animateWithDuration:0.25
                     animations:^{
                         _scrollView.contentOffset = CGPointMake(_menuView.frame.size.width, 0);
                     }];
}

#pragma mark - Observer
- (void)registerObserverToShowMenu {
    //注册观察者用于响应文章列表界面的菜单按钮
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showMenu) name:@"showMenu" object:nil];
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
