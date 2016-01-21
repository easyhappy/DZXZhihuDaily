//
//  CustomTabBar.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/20.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize fitSize = [super sizeThatFits:size];
    fitSize.height = 35;
    
    return fitSize;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
