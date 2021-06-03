//
//  MyTableViewController.m
//  Hypnosister
//
//  Created by bytedance on 2021/6/2.
//  Copyright © 2021 John Gallagher. All rights reserved.
//

#import "MyTableViewController.h"
#import "HypnosisView.h"
#import "AppDelegate.h"
@interface MyTableViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *arrList;
}
@end

@implementation MyTableViewController
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"我的";
        UIImage *image = [UIImage imageNamed:@"mine.png"];
        self.tabBarItem.image = image;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //初始化我的信息
    arrList =
    @[
        @[[NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"title",@"",@"image",@"1",@"isshow",nil],],
        @[[NSMutableDictionary dictionaryWithObjectsAndKeys:@"",@"title",@"",@"image",@"1",@"isshow",nil],],
        @[
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"邀请有礼",@"title",@"icon_invite",@"image",@"1",@"isshow",nil],
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"我的行情",@"title",@"icon_myMarket",@"image",@"1",@"isshow",nil],
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"模拟炒股",@"title",@"icon_simulateStock",@"image",@"1",@"isshow",nil],
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"增值服务",@"title",@"icon_addService",@"image",@"1",@"isshow",nil]
        ],@[
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"帮助与客服",@"title",@"icon_help",@"image",@"1",@"isshow",nil],
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"功能反馈",@"title",@"icon_function",@"image",@"1",@"isshow",nil],
            [NSMutableDictionary dictionaryWithObjectsAndKeys:@"评价App",@"title",@"icon_evaluate",@"image",@"1",@"isshow",nil],
        ],
    ];
    int cutHeight = 54, addRight = 30;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 130.0f)];
    //设置按钮
    UIButton *btn_setting = [[UIButton alloc] initWithFrame:CGRectMake(295 +addRight, 54 - cutHeight, 24, 24)];
    btn_setting.backgroundColor = [UIColor clearColor];
    [btn_setting setBackgroundImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [btn_setting addTarget:self action:@selector(btn_setting_touch:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn_setting];
    //黑白天模式
    UIButton *btn_sun = [[UIButton alloc] initWithFrame:CGRectMake(214.4+addRight, 54.7 - cutHeight, 24, 24)];
    btn_sun.backgroundColor = [UIColor clearColor];
    [btn_sun setBackgroundImage:[UIImage imageNamed:@"sun"] forState:UIControlStateNormal];
    [btn_sun addTarget:self action:@selector(btn_sun_touch:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn_sun];
    
    UIButton *btn_moon = [[UIButton alloc] initWithFrame:CGRectMake(255+addRight, 54-cutHeight, 24, 24)];
    btn_moon.backgroundColor = [UIColor clearColor];
    [btn_moon setBackgroundImage:[UIImage imageNamed:@"moon"] forState:UIControlStateNormal];
    [btn_moon addTarget:self action:@selector(btn_moon_touch:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn_moon];
//    [UIImage imageNamed:@"mulan"]
    UIImageView *head = [[UIImageView alloc] initWithFrame:CGRectMake(20, 89-cutHeight, 48, 48)];
    head.backgroundColor = [UIColor clearColor];
    head.image = [UIImage imageNamed:@"mulan"];
    [head.layer setCornerRadius:CGRectGetHeight([head bounds]) / 2];//修改半径，实现头像的圆形化
    head.contentMode = UIViewContentModeScaleAspectFit;
    head.clipsToBounds = YES;//裁剪边缘
    [view addSubview:head];
    
    UILabel *lb_name = [[UILabel alloc] initWithFrame:CGRectMake(78, 91-cutHeight, 54, 25)];
    lb_name.textAlignment = NSTextAlignmentCenter;
    lb_name.text = @"花木兰";
    lb_name.font = [UIFont boldSystemFontOfSize:18];
    lb_name.backgroundColor = [UIColor clearColor];
    lb_name.textColor = [UIColor blackColor];
    [lb_name sizeToFit];
    [view addSubview:lb_name];
    
    UILabel *lb_name_info = [[UILabel alloc] initWithFrame:CGRectMake(78, 118-cutHeight, 93, 17)];
    lb_name_info.textAlignment = NSTextAlignmentCenter;
    lb_name_info.text = @"海豚账号 129409";
    lb_name_info.font = [UIFont fontWithName:@ "Arial" size:12];
    lb_name_info.backgroundColor = [UIColor clearColor];
    lb_name_info.textColor = [UIColor grayColor];
    [lb_name sizeToFit];
    [view addSubview:lb_name_info];
    view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnArrowRgiht = [[UIButton alloc] initWithFrame:CGRectMake(351+addRight, 107-cutHeight, 8, 12)];
    btnArrowRgiht.backgroundColor = [UIColor clearColor];
    [btnArrowRgiht setBackgroundImage:[UIImage imageNamed:@"arrowRight"] forState:UIControlStateNormal];
    [btnArrowRgiht addTarget:self action:@selector(btn_arrowRight_touch:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btnArrowRgiht];
    
    UIButton *btnInfor = [[UIButton alloc] initWithFrame:CGRectMake(335+addRight, 54-cutHeight, 24, 24)];
    btnInfor.backgroundColor = [UIColor clearColor];
    [btnInfor setBackgroundImage:[UIImage imageNamed:@"infor"] forState:UIControlStateNormal];
    [btnInfor addTarget:self action:@selector(btn_infor_touch) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btnInfor];
    
    UILabel *lb_focus = [[UILabel alloc] initWithFrame:CGRectMake(47, 158-cutHeight, 0, 0)];
    lb_focus.textAlignment = NSTextAlignmentCenter;
    lb_focus.text = @"30关注";
    lb_focus.lineBreakMode = NSLineBreakByWordWrapping;//自动换行
    lb_focus.font = [UIFont fontWithName:@ "Arial" size:12];
    lb_focus.backgroundColor = [UIColor clearColor];
    lb_focus.textColor = [UIColor blackColor];
    [lb_focus sizeToFit];
    [view addSubview:lb_focus];
    
    UILabel *lb_card = [[UILabel alloc] initWithFrame:CGRectMake(131, 158-cutHeight, 0, 0)];
    lb_card.textAlignment = NSTextAlignmentCenter;
    lb_card.text = @"5卡券";
    lb_card.lineBreakMode = NSLineBreakByWordWrapping;//自动换行
    lb_card.font = [UIFont fontWithName:@ "Arial" size:12];
    lb_card.backgroundColor = [UIColor clearColor];
    lb_card.textColor = [UIColor blackColor];
    [lb_card sizeToFit];
    [view addSubview:lb_card];
    
    UILabel *lb_history = [[UILabel alloc] initWithFrame:CGRectMake(204, 158-cutHeight, 0, 0)];
    lb_history.textAlignment = NSTextAlignmentCenter;
    lb_history.text = @"84收藏/历史";
    lb_history.lineBreakMode = NSLineBreakByWordWrapping;//自动换行
    lb_history.font = [UIFont fontWithName:@ "Arial" size:12];
    lb_history.backgroundColor = [UIColor clearColor];
    lb_history.textColor = [UIColor blackColor];
    [lb_history sizeToFit];
    [view addSubview:lb_history];
    
    UILabel *lb_waring = [[UILabel alloc] initWithFrame:CGRectMake(295, 158-cutHeight, 0, 0)];
    lb_waring.textAlignment = NSTextAlignmentCenter;
    lb_waring.text = @"14个股预警";
    lb_waring.lineBreakMode = NSLineBreakByWordWrapping;//自动换行
    lb_waring.font = [UIFont fontWithName:@ "Arial" size:12];
    lb_waring.backgroundColor = [UIColor clearColor];
    lb_waring.textColor = [UIColor blackColor];
    [lb_waring sizeToFit];
    [view addSubview:lb_waring];
    
    view.backgroundColor = [UIColor whiteColor];
    
    //初始化tableview
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+200, 400, 600) style:UITableViewStyleGrouped];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 400, 600) style:UITableViewStyleGrouped];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];//全局变量的一种方式
    self.tableView = [[UITableView alloc] initWithFrame:myDelegate.window.bounds];
    /*
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }*/
    self.tableView.delegate=self;
    self.tableView.dataSource = self;
//    self.tableView.contentInset = UIEdgeInsetsMake(160, 0, 0, 0);
    self.tableView.rowHeight=52.0f;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableHeaderView = view;
    self.tableView.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:249.0/255.0 blue:250.0/255.0 alpha:1.0];
    
    [self.view addSubview:self.tableView];
    
    //定义复用的cell
    [self.tableView registerClass:[SetupListCell class] forCellReuseIdentifier:@"setuplistcell"];
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
-(void)btn_infor_touch:(UIButton*)btn{
    NSLog(@"btn_infor_touch");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"分组数：%i",arrList.count);
    return arrList.count;
}
//设置每个分组下tableview的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) return 1;
    else{
        NSArray *arrSection = arrList[section];
//        NSLog(@"每个分组下的行数：%i", arrSection.count);
        return arrSection.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"setuplistcell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setuplistcell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setuplistcell"];
    if(cell == nil){
       cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    /*
    if(indexPath.section == 0){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"setuplistcell"];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 180, 180)];
        imageView.image=[UIImage imageNamed:@"mulan"];
        [cell.contentView addSubview:imageView];

        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 60, 80)];
        nameLabel.text=@"李晨";
        [cell.contentView addSubview:nameLabel];
        
    }*/
    if(TRUE){
        NSArray *arrSection = arrList[indexPath.section];
        NSDictionary *dictData = arrSection[indexPath.row];
        
        if(indexPath.section == 0){
            UILabel *lb_txt = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.origin.x+10,cell.bounds.origin.y+10,97,24)];
            lb_txt.textAlignment = NSTextAlignmentCenter;
            lb_txt.text = @"活动中心";
            lb_txt.font = [UIFont boldSystemFontOfSize:17];
            lb_txt.backgroundColor = [UIColor clearColor];
            lb_txt.textColor = [UIColor blackColor];
            [lb_txt sizeToFit];
            [cell.contentView addSubview:lb_txt];
            
            UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(cell.bounds.origin.x+5, cell.bounds.origin.y + 44, 150, 80)];
            pic.backgroundColor = [UIColor clearColor];
            pic.image = [UIImage imageNamed:@"gift"];
            pic.contentMode = UIViewContentModeScaleAspectFit;
            [cell.contentView addSubview:pic];
            return cell;
        }
        
        if(indexPath.section == 1){
            UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(cell.bounds.origin.x + 16, cell.bounds.origin.y + 32, 108, 46)];
            view1.backgroundColor = [UIColor colorWithRed:247.0/250.0 green:249.0/250.0 blue:250.0/250.0 alpha:1.0];
            
            UILabel *lb_txt1 = [[UILabel alloc] initWithFrame:CGRectMake(view1.bounds.origin.x + 30,view1.bounds.origin.y + 15,56,13)];
            lb_txt1.textAlignment = NSTextAlignmentCenter;
            lb_txt1.text = @"海通证券";
            lb_txt1.font = [UIFont boldSystemFontOfSize:14];
            lb_txt1.backgroundColor = [UIColor clearColor];
            lb_txt1.textColor = [UIColor blackColor];
            [lb_txt1 sizeToFit];
            [view1 addSubview:lb_txt1];
            
            UIImageView *haitong_pic = [[UIImageView alloc] initWithFrame:CGRectMake(view1.bounds.origin.x+5, view1.bounds.origin.y + 10, 24, 24)];
            haitong_pic.backgroundColor = [UIColor clearColor];
            haitong_pic.image = [UIImage imageNamed:@"icon_haitong"];
            [view1 addSubview:haitong_pic];
            [cell.contentView addSubview:view1];
            
            UILabel *lb_txt = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.origin.x+10,cell.bounds.origin.y+10,97,24)];
            lb_txt.textAlignment = NSTextAlignmentCenter;
            lb_txt.text = @"A股实盘交易";
            lb_txt.font = [UIFont boldSystemFontOfSize:17];
            lb_txt.backgroundColor = [UIColor clearColor];
            lb_txt.textColor = [UIColor blackColor];
            [lb_txt sizeToFit];
            [cell.contentView addSubview:lb_txt];
            return cell;
        }
        
        cell.textLabel.text = [dictData objectForKey:@"title"];
        cell.imageView.image=[UIImage imageNamed:[dictData objectForKey:@"image"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        
        if(indexPath.section == 2 && indexPath.row == 0){
            UILabel *lb_txt = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.origin.x + cell.bounds.size.width-2,cell.bounds.origin.y + 20,66,17)];
            lb_txt.textAlignment = NSTextAlignmentCenter;
            lb_txt.text = @"好友t77刚了";
            lb_txt.font = [UIFont boldSystemFontOfSize:12];
            lb_txt.backgroundColor = [UIColor clearColor];
            lb_txt.textColor = [UIColor grayColor];
            [lb_txt sizeToFit];
            [cell.contentView addSubview:lb_txt];
        }
        if(indexPath.section == 2 && indexPath.row == 2){
            UILabel *lb_txt = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.origin.x + cell.bounds.size.width-40,cell.bounds.origin.y + 20,97,17)];
            lb_txt.textAlignment = NSTextAlignmentCenter;
            lb_txt.text = @"今日盈亏6,490.56";
            lb_txt.font = [UIFont boldSystemFontOfSize:12];
            lb_txt.backgroundColor = [UIColor clearColor];
            lb_txt.textColor = [UIColor grayColor];
            [lb_txt sizeToFit];
            [cell.contentView addSubview:lb_txt];
        }
    }
    return cell;
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3.0f;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3.0f;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return 130;
    }
    if(indexPath.section == 1){
        return  90;
    }
    return 52;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"点击了section: %i  row: %i", indexPath.section, indexPath.row);
            #warning 待定代码 设置
//            RDSetupViewController *setupvc = [[RDSetupViewController alloc]init];
//            self.navigationItem.backBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
//            [self.navigationController pushViewController:setupvc animated:NO];
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
