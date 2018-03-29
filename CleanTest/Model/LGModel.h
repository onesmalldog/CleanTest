//
//  LGModel.h
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define Default_Width 200
#define Default_FontSize 17
#define Default_TitleHeight 40


@interface LGModel : NSObject

@property (nonatomic,  copy ) NSString *desc;
@property (nonatomic,  copy ) NSString *imageHref;
@property (nonatomic,  copy ) NSString *title;

+ (instancetype)modelWithDict:(NSDictionary *)dic;

- (CGFloat)getBottom;

- (CGFloat)getTitleHeightWithDefault;
- (CGFloat)getTitleHeightWithStr:(NSString *)str fontSize:(CGFloat)font width:(CGFloat)width;

- (CGFloat)getImageHeightFromImage:(UIImage *)image;

@end
