//
//  ArticleCustomTableViewCell.m
//  DZXZhihuDaily
//
//  Created by Kenway on 16/1/13.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ArticleCustomTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ArticleCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    return self;
}

- (void)setCellWithModel:(ArticleListModel *)model {
    self.textTitle.text = model.title;
    
    [self.imagePreview sd_setImageWithURL:[NSURL URLWithString:model.images]
                         placeholderImage:[UIImage imageNamed:@"Image_Preview"]];
    
    if (model.isMultipic == YES) {
        self.imageMorepic.image = [UIImage imageNamed:@"Home_Morepic"];
        self.imageMorepic.hidden = NO;
    }
    else {
        self.imageMorepic.hidden = YES;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
