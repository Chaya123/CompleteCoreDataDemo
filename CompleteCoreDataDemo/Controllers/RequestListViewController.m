//
//  RequestListViewController.m
//  LcjInterViewDemo
//
//  Created by liu on 2017/6/4.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "RequestListViewController.h"
#import "RequestDealViewController.h"
#import "CommandModel.h"
#import "TableViewCell.h"

@interface RequestListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *listTableView;

@end

@implementation RequestListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.navigationItem.title = @"查询列表";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.listTableView];
}

#pragma mark - Tableview Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    CommandModel *model = self.listArray[indexPath.row];
    cell.commandModel = model;
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CommandModel *model = self.listArray[indexPath.row];
    if (((self.personClass == PERSONCLASS_OPERATOR) && (model.dealStatus.intValue == DEAL_STATUS_COMMIT)) || ((self.personClass == PERSONCLASS_MANAGE) && (model.dealStatus.intValue == DEAL_STATUS_WAITCHECKSUCCESS))) {
        
        RequestDealViewController *VC = [[RequestDealViewController alloc] init];
        VC.model = model;
        [self.navigationController pushViewController:VC animated:YES];
    }
}
#pragma mark - Setter && Getter

- (void)setListArray:(NSArray *)listArray {
    
    _listArray = listArray;
}

- (UITableView *)listTableView {
    
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStyleGrouped];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.rowHeight = 155.0f;
        _listTableView.showsVerticalScrollIndicator = NO;
    }
    return _listTableView;
}

@end
