//
//  LaunchScreenViewController.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/3.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "LaunchScreenViewController.h"
#import "DZXHttpRequest.h"
#import "launchScreenModel.h"
#import "MainViewController.h"

@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [self getLaunchScreenData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //启动界面隐藏导航栏
    self.navigationView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HTTP request
- (void)getLaunchScreenData{
    [DZXHttpRequest getDataWithURL:STARTIMAGE_URL
                         parameter:nil
                           success:^(id responseDict) {
                               //字典转模型
                               _model = [[launchScreenModel alloc] initWithDict:responseDict];
                               //数据赋值
                               NSURL *url = [NSURL URLWithString:_model.image];
                               NSData *data = [NSData dataWithContentsOfURL:url];
                               self.imageLaunchScreen.image = [UIImage imageWithData:data];
                               self.textCopyright.text = _model.text;
                               [self launchImageTransition:_imageLaunchScreen label:_textCopyright];
                           } fail:^(NSError *error) {
                           }];
}

#pragma mark - UI Transition
- (void)launchImageTransition:(UIImageView *)image label:(UILabel *)label {
    label.alpha = 0.5;
    image.alpha = 0.5;
    [UIView animateWithDuration:3
                     animations:^{
                         image.alpha = 1.0;
                         label.alpha = 1.0;
                         image.transform = CGAffineTransformMakeScale(1.15, 1.15);
                     } completion:^(BOOL finished) {
                         UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
                         MainViewController *mainViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"mainView"];
                         [self.navigationController pushViewController:mainViewController animated:NO];
                     }];
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
