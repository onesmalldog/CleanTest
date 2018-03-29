//
//  LGModel.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "LGModel.h"

@implementation LGModel

- (CGFloat)getImageHeightFromImage:(UIImage *)image {
    return image.size.height;
}

- (CGFloat)getBottom {
    
    CGFloat res =  20 + Default_TitleHeight + 100;
    if (!self.title && !self.desc && !self.imageHref) {
        return 0;
    }
    else if (!self.desc && self.imageHref) {
        return res;
    }
    
    CGFloat desc = [self getTitleHeightWithDefault];
    
    CGFloat res1 = 10 + Default_TitleHeight + 10 + desc + 10;
    
    if (res1 < res) {
        return res;
    }
    else res = res1;
    
    return res;
}

- (CGFloat)getTitleHeightWithDefault {
    return [self getTitleHeightWithStr:self.desc fontSize:Default_FontSize width:Default_Width];
}

- (CGFloat)getTitleHeightWithStr:(NSString *)str fontSize:(CGFloat)font width:(CGFloat)width {
    
    return [self getStringHeight:str withFont:font withWidth:width];
}

- (CGFloat)getStringHeight:(NSString *)str withFont:(CGFloat)font withWidth:(CGFloat)width {
    
    CGSize size = CGSizeMake(width ,MAXFLOAT);
    
    CGSize resSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    
    return resSize.height;
}

+ (instancetype)modelWithDict:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}

@end
