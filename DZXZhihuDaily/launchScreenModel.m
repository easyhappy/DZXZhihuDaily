//
//  launchScreenModel.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/2.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "launchScreenModel.h"

@implementation launchScreenModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _text = [dict objectForKey:@"text"];
        _image = [dict objectForKey:@"img"];
    }

    return self;
}

@end
