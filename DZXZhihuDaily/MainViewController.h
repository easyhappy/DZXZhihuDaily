//
//  MainViewController.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/3.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

@interface MainViewController : DZXViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *menuView; //菜单容器
@property (strong, nonatomic) IBOutlet UIView *ListView; //列表容器
@property (strong, nonatomic) UIControl *tapView;

@end
