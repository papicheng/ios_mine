//
//  SetupListCell.m
//  Hypnosister
//
//  Created by bytedance on 2021/6/2.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import "SetupListCell.h"

@implementation SetupListCell
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//重写layoutSubviews方法，以便实现图片大小效果
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame=CGRectMake(15, (self.frame.size.height-20)/2, 20, 20);
    self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    CGRect tempframe = self.textLabel.frame;
    tempframe.origin.x=50;
    self.textLabel.frame=tempframe;
    self.textLabel.font=[UIFont systemFontOfSize:14];
    self.separatorInset=UIEdgeInsetsMake(0, 50, 0, 0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
