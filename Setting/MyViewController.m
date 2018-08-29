//
//  MyViewController.m
//  Setting
//
//  Created by zhouen on 2018/8/29.
//  Copyright © 2018年 zhouen. All rights reserved.
//

#import "MyViewController.h"
#import "CCItem.h"
#import "CCSection.h"

@interface MyViewController ()
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_init];
    // Do any additional setup after loading the view.
}

#pragma - mark setup
- (void)p_init
{
    //************************************section1
    CCItem *item1 = [[CCItem alloc]init];
    item1.text = @"我的余额";
    item1.execute = ^{
        NSLog(@"我的余额");
        
    };
    item1.detailText = @"做任务赢大奖";
    item1.accessoryType = CCSettingAccessoryTypeNone;
    
    CCItem *item2 = [[CCItem alloc]init];
    item2.text = @"修改密码";
    item2.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCSection *section1 = [[CCSection alloc]init];
    section1.headerHeight = 18;
    section1.items = @[item1,item2];
    
    //************************************section2
    CCItem *item3 = [[CCItem alloc]init];
    item3.text = @"推送提醒";
    item3.accessoryType = CCSettingAccessoryTypeSwitch;
    item3.switchValueChanged = ^(BOOL isOn)
    {
        NSLog(@"推送提醒开关状态===%@",isOn?@"open":@"close");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"推送提醒" message:isOn?@"open":@"close" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    };
    
    CCItem *item4 = [[CCItem alloc]init];
    item4.text = @"给我们打分";
    item4.detailImage = [UIImage imageNamed:@"icon-new"];
    item4.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCItem *item5 = [[CCItem alloc]init];
    item5.text = @"意见反馈";
    item5.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCSection *section2 = [[CCSection alloc]init];
    section2.headerHeight = 18;
    section2.items = @[item3,item4,item5];
    
    
    //************************************section3
    CCItem *item6 = [[CCItem alloc]init];
    item6.text = @"关于我们";
    item6.detailText = @"关于我们";
    item6.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCItem *item7 = [[CCItem alloc]init];
    item7.text = @"帮助中心";
    item7.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCItem *item8 = [[CCItem alloc]init];
    item8.text = @"清除缓存";
    item8.accessoryType = CCSettingAccessoryTypeDisclosureIndicator;
    
    CCSection *section3 = [[CCSection alloc]init];
    section3.headerHeight = 18;
    section3.items = @[item6,item7,item8];
    
    self.sections= @[section1,section2,section3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
