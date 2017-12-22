//
//  CLMeTableViewCell.m
//  百思不得其解
//
//  Created by LongCh on 2017/12/17.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLMeTableViewCell.h"


@implementation CLMeTableViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];自定义图片
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    if (self.imageView.image == nil) {
        return;
    }
    self.imageView.CL_Y = CLSmallMargin;
    self.imageView.CL_height = self.contentView.CL_height - 2 * CLSmallMargin;
    self.imageView.CL_wight = self.imageView.CL_height;
    
    self.textLabel.CL_X = CGRectGetMaxX(self.imageView.frame) + CLMargin;
}
@end
