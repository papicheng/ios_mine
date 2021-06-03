//
//  ViewController.m
//  Hypnosister
//
//  Created by bytedance on 2021/6/1.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCellTableViewCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

//定义一个数组和输出接口
@property (copy, nonatomic) NSArray *computers;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 往数组里定义字典
    self.computers = @[@{@"Name" : @"MacBook Air",@"Color" : @"Sliver"},
                       @{@"Name" : @"MacBook Pro",@"Color" : @"Sliver"},
                       @{@"Name" : @"iMac",@"Color" : @"Sliver"},
                       @{@"Name" : @"Mac Mini",@"Color" : @"Sliver"},
                       @{@"Name" : @"Mac Pro",@"Color" : @"Black"},];
    [self.tableView registerClass:[NameAndColorCellTableViewCell class]forCellReuseIdentifier:CellTableIdentifier];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
// 返回数组元素个数的行数,这里return的数不能大于元素的个数，否则崩溃
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.computers count];
}

-(UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NameAndColorCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier forIndexPath:indexPath];
    NSDictionary * rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return  cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
