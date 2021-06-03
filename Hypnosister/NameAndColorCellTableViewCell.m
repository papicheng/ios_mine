//
//  NameAndColorCellTableViewCell.m
//  Hypnosister
//
//  Created by bytedance on 2021/6/1.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import "NameAndColorCellTableViewCell.h"

@interface NameAndColorCellTableViewCell()
@property(strong, nonatomic) UILabel *nameLabel;
@property(strong, nonatomic) UILabel *colorLabel;
@end

@implementation NameAndColorCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //往表单元里添加子视图
        //这里在每个表单元里添加了四个Label
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMake = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameMake.textAlignment = NSTextAlignmentRight;
        nameMake.text = @"Name:";
        nameMake.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameMake];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colormake = [[UILabel alloc] initWithFrame:colorLabelRect];
        colormake.textAlignment = NSTextAlignmentRight;
        colormake.text = @"Color:";
        colormake.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:colormake];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        self.nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
        self.colorLabel = [[UILabel alloc] initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorLabel];
    }
    return self;
}
//重写Name和Color的set方法，当传递一个新的值时，更新标签的额外内容
-(void) setName:(NSString *)name{
    if(![name isEqualToString:_name]){
        _name = [name copy];
        self.nameLabel.text = _name;
    }
}

-(void) setColor:(NSString *)color{
    if(![color isEqualToString:_color]){
        _color = [color copy];
        self.colorLabel.text = _color;
    }
}
@end
