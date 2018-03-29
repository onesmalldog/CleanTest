//
//  LGTitleModel.h
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGTitleModel : NSObject

@property (nonatomic,  copy ) NSString *title;
@property (nonatomic,  copy ) NSArray *rows;

+ (instancetype)modelWithDict:(NSDictionary *)dic;

@end
