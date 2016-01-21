//
//  launchScreenModel.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/2.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface launchScreenModel : NSObject

@property (copy, nonatomic) NSString *text; //供显示的图片版权信息
@property (copy, nonatomic) NSString *image; //启动界面图片URL

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
