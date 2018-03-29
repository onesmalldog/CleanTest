//
//  LGTitleModel.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "LGTitleModel.h"

@implementation LGTitleModel

+ (instancetype)modelWithDict:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
