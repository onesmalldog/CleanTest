//
//  LGNetwork.h
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGNetwork : NSObject

+ (void)getJsonResponseWithCallback:(void(^)(NSDictionary *res))callBack;

@end
