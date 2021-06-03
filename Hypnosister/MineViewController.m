//
//  MineViewController.m
//  Hypnosister
//
//  Created by bytedance on 2021/6/2.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import "MineViewController.h"
#import "MyTableViewController.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置按钮
    UIButton *btn_setting = [[UIButton alloc] initWithFrame:CGRectMake(295, 54, 24, 24)];
    btn_setting.backgroundColor = [UIColor clearColor];
    [btn_setting setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [btn_setting addTarget:self action:@selector(btn_setting_touch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_setting];
    //黑白天模式
    UIButton *btn_sun = [[UIButton alloc] initWithFrame:CGRectMake(214.4, 54.7, 24, 24)];
    btn_sun.backgroundColor = [UIColor clearColor];
    [btn_sun setBackgroundImage:[UIImage imageNamed:@"sun"] forState:UIControlStateNormal];
    [btn_sun addTarget:self action:@selector(btn_sun_touch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_sun];
    
    UIButton *btn_moon = [[UIButton alloc] initWithFrame:CGRectMake(255, 54, 24, 24)];
    btn_moon.backgroundColor = [UIColor clearColor];
    [btn_moon setBackgroundImage:[UIImage imageNamed:@"moon"] forState:UIControlStateNormal];
    [btn_moon addTarget:self action:@selector(btn_moon_touch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_moon];
//    [UIImage imageNamed:@"mulan"]
    UIImageView *head = [[UIImageView alloc] initWithFrame:CGRectMake(20, 89, 48, 48)];
    head.backgroundColor = [UIColor clearColor];
    head.image = [UIImage imageNamed:@"mulan"];
    [head.layer setCornerRadius:CGRectGetHeight([head bounds]) / 2];//修改半径，实现头像的圆形化
    head.contentMode = UIViewContentModeScaleAspectFit;
    head.clipsToBounds = YES;//裁剪边缘
    [self.view addSubview:head];
    
    UILabel *lb_name = [[UILabel alloc] initWithFrame:CGRectMake(78, 91, 54, 25)];
    lb_name.text = @"花木兰";
    lb_name.font = [UIFont boldSystemFontOfSize:14];
    lb_name.backgroundColor = [UIColor clearColor];
    lb_name.textColor = [UIColor blackColor];
    [self.view addSubview:lb_name];
    
    UILabel *lb_name_info = [[UILabel alloc] initWithFrame:CGRectMake(78, 118, 93, 17)];
    lb_name_info.text = @"海豚账号 129409";
    lb_name_info.font = [UIFont fontWithName:@ "Arial" size:10];
    lb_name_info.backgroundColor = [UIColor clearColor];
    lb_name_info.textColor = [UIColor grayColor];
    [self.view addSubview:lb_name_info];
    
    UIButton *btnArrowRgiht = [[UIButton alloc] initWithFrame:CGRectMake(351, 107, 8, 12)];
    btnArrowRgiht.backgroundColor = [UIColor clearColor];
    [btnArrowRgiht setBackgroundImage:[UIImage imageNamed:@"arrowRight"] forState:UIControlStateNormal];
    [btnArrowRgiht addTarget:self action:@selector(btn_arrowRight_touch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnArrowRgiht];
    
    MyTableViewController* myTable = [[MyTableViewController alloc]init];
    [self.view addSubview:myTable.tableView];
}

-(void)btn_setting_touch:(UIButton*)btn{
    NSLog(@"btn_setting_touch");
}
-(void)btn_sun_touch:(UIButton*)btn{
    NSLog(@"btn_sun_touch");
}
-(void)btn_moon_touch:(UIButton*)btn{
    NSLog(@"btn_moon_touch");
}
-(void)btn_arrowRight_touch:(UIButton*)btn{
    NSLog(@"btn_arrowRight_touch");
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
