//
//  SettingController.h
//  Setting
//
//  Created by zhouen on 17/05/3.
//  Copyright © 2017年 zhouen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCItem.h"
#import "CCSection.h"

@interface CCSettingController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)   UITableView *tableView;
@property (nonatomic, strong)   NSArray *sections;
@end
