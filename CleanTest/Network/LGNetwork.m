//
//  LGNetwork.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "LGNetwork.h"
#import "AFNetworking.h"

#define URL @"http://thoughtworks-ios.herokuapp.com/facts.json"

@implementation LGNetwork

+ (void)load {
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
}

+ (void)getJsonResponseWithCallback:(void (^)(NSDictionary *))callBack {
    
    [[AFHTTPSessionManager manager] GET:URL parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"Req success");
        callBack(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Failed: %@", error);
        callBack(nil);
        
    }];
}

@end
