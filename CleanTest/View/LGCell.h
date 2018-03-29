//
//  LGCell.h
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LGModel;

@interface LGCell : UITableViewCell

@property (nonatomic,  weak ) UILabel *titleLabel;
@property (nonatomic,  weak ) UILabel *contentLabel;
@property (nonatomic,  weak ) UIImageView *imageV;

@property (nonatomic, strong) LGModel *model;
@property (nonatomic, assign) CGFloat contentHeight;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
