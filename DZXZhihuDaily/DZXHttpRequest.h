//
//  DZXHttpRequest.h
//  DZXZhihuDaily
//
//  Created by 邓梓暄 on 16/1/2.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZXHttpRequest : NSObject

+ (void)getDataWithURL:(NSString *)url
             parameter:(NSDictionary *)parameter
               success:(void (^)(id responseDict))success
                  fail:(void (^)(NSError *error))fail;

@end
