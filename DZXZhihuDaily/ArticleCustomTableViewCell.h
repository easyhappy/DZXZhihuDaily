//
//  ArticleCustomTableViewCell.h
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/13.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleListModel.h"

@interface ArticleCustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *textTitle; //文章标题
@property (strong, nonatomic) IBOutlet UIImageView *imagePreview;
@property (strong, nonatomic) IBOutlet UIImageView *imageMorepic;

- (void)setCellWithModel:(ArticleListModel *)model;

@end
