//
//  SettingController.m
//  Setting
//
//  Created by zhouen on 17/05/3.
//  Copyright © 2017年 zhouen. All rights reserved.
//

#import "CCSettingController.h"
#import "CCSettingCell.h"

@interface CCSettingController()

@end

@implementation CCSettingController

#pragma mark ------ Lifecycle
- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[UIView new]];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.separatorColor = [UIColor colorWithWhite:0.4 alpha:0.3];
    [_tableView registerClass:[CCSettingCell class] forCellReuseIdentifier:NSStringFromClass([CCSettingCell class])];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.view addSubview:_tableView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ------ UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CCSection *sectionModel = self.sections[section];
    return sectionModel.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CCSection *sectionModel = self.sections[indexPath.section];
    CCItem *item = sectionModel.items[indexPath.row];
    CCSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCSettingCell class]) forIndexPath:indexPath];
    cell.item = item;
    
    
    return cell;
}



#pragma mark ------ UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CCSection *sectionModel = self.sections[section];
    return sectionModel.headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CCSection *sectionModel = self.sections[section];
    return sectionModel.footerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CCSection *sectionModel = self.sections[section];
    return sectionModel.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    CCSection *sectionModel = self.sections[section];
    return sectionModel.footerTitle;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CCSection *sectionModel = self.sections[section];
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, sectionModel.headerHeight)];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CCSection *sectionModel = self.sections[section];
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, sectionModel.footerHeight)];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CCSection *sectionModel = self.sections[indexPath.section];
    CCItem *item = sectionModel.items[indexPath.item];
    if (item.execute) {
        item.execute();
    }
}


@end
