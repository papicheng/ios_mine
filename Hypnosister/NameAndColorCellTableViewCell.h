//
//  NameAndColorCellTableViewCell.h
//  Hypnosister
//
//  Created by bytedance on 2021/6/1.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NameAndColorCellTableViewCell : UITableViewCell

@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *color;

@end

NS_ASSUME_NONNULL_END
