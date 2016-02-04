//
//  MenuViewController.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/4.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "MenuViewController.h"
#import "ContentCustomTableViewCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initContentList];
    
    self.contentTableView.rowHeight = 44;
    self.navigationView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Array
- (void)initContentList {
    self.contentList = @[@"首页",
                         @"日常心理学",
                         @"电影日报",
                         @"不许无聊",
                         @"设计日报",
                         @"大公司日报",
                         @"财经日报",
                         @"互联网安全",
                         @"开始游戏",
                         @"音乐日报",
                         @"动漫日报",
                         @"体育日报"];
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ContentCell";
    ContentCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.contentText.text = self.contentList[indexPath.row];
    
    return cell;
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
