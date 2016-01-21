//
//  DZXHttpRequest.m
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/2.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "DZXHttpRequest.h"
#import <AFNetworking.h>

@implementation DZXHttpRequest

+ (void)getDataWithURL:(NSString *)url
             parameter:(NSDictionary *)parameter
               success:(void (^)(id))success
                  fail:(void (^)(NSError *))fail{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url
      parameters:parameter
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             success(responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             fail(error);
         }];
}

@end
