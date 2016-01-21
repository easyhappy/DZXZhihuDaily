//
//  MenuViewController.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/4.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

@interface MenuViewController : DZXViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *contentList;
@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@end
