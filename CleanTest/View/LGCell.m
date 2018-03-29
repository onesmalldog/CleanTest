//
//  LGCell.m
//  CleanTest
//
//  Created by lizhengang on 29/03/2018.
//  Copyright © 2018 李振刚. All rights reserved.
//

#import "LGCell.h"
#import "LGModel.h"

#import "UIImageView+WebCache.h"

@implementation LGCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifer = @"cell1";
    
    [tableView registerClass:[self class] forCellReuseIdentifier:identifer];
    
    LGCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)setModel:(LGModel *)model {
    
    _model = model;
    
    if (!model.title && !model.desc && !model.imageHref) {
        self.imageV.frame = CGRectZero;
        self.imageV.hidden = TRUE;
        
        self.titleLabel.text = @"";
        self.titleLabel.hidden = TRUE;
        
        self.contentLabel.text = @"";
        self.contentLabel.hidden = TRUE;
        return;
    }
    CGFloat titleLabelX = 10;
    CGFloat titleLabelY = 10;
    CGFloat titleLabelW = Default_Width;
    CGFloat titleLabelH = Default_TitleHeight;
    self.titleLabel.hidden = FALSE;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    self.titleLabel.text = model.title;
    
    if (!model.desc) {
        self.contentLabel.hidden = TRUE;
    }
    else {
        CGFloat contentLabelX = 10;
        CGFloat contentLabelY = CGRectGetMaxY(self.titleLabel.frame) + 10;
        CGFloat contentLabelW = Default_Width;
        CGFloat contentLabelH = [model getTitleHeightWithDefault];
        self.contentLabel.hidden = FALSE;
        self.contentLabel.frame = CGRectMake(contentLabelX, contentLabelY, contentLabelW, contentLabelH);
        self.contentLabel.text = model.desc;
    }
    if (!model.imageHref) {
        self.imageV.image = nil;
        self.imageV.frame = CGRectZero;
        self.imageV.hidden = TRUE;
        return;
    }
    
    self.imageV.hidden = FALSE;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.imageHref] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!image) {
            self.imageV.image = nil;
            self.imageV.frame = CGRectZero;
            self.imageV.hidden = TRUE;
            return;
        }
        
        CGFloat imageVX = 10 + Default_Width + 10;
        CGFloat imageVY = 10 + Default_TitleHeight;
        CGFloat imageVW = 100;
        CGFloat imageVH = image.size.height/image.size.width*imageVW;
        self.imageV.frame = CGRectMake(imageVX, imageVY, imageVW, imageVH);
        self.imageV.image = image;
    }];
}

- (void)createUI {
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.font = [UIFont systemFontOfSize:21];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    contentLabel.font = [UIFont systemFontOfSize:Default_FontSize];
    contentLabel.numberOfLines = 0;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    
    CGFloat imageVX = 10 + Default_Width + 10;
    CGFloat imageVY = 10 + Default_TitleHeight;
    CGFloat imageVW = 100;
    CGFloat imageVH = 100;
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder"]];
    imageV.frame = CGRectMake(imageVX, imageVY, imageVW, imageVH);
    [self addSubview:imageV];
    self.imageV = imageV;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
