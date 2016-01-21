//
//  LaunchScreenViewController.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/3.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXViewController.h"

@class launchScreenModel;

@interface LaunchScreenViewController : DZXViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageLaunchScreen; //启动图片
@property (strong, nonatomic) IBOutlet UILabel *textCopyright; //版权信息

@property (strong, nonatomic) launchScreenModel *model; 

@end
