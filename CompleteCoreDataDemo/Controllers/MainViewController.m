//
//  MainViewController.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "MainViewController.h"
#import "DevInsertCommandVC.h"
#import "RequestListViewController.h"
#import "CommandDataService.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (IBAction)dev_insertACommand:(UIButton *)sender {
    
    [self.navigationController pushViewController:[[DevInsertCommandVC alloc] init] animated:YES];
}

- (IBAction)dev_QueryCommandList:(UIButton *)sender {
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_ALL];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_DEV;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)operater_QueryAndDealCommandList:(UIButton *)sender{
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_ALL];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_OPERATOR;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)manage_QueryAndDealCommandList:(UIButton *)sender{
    
    NSArray *listArray = [[CommandDataService shareData] queryCommandListDealStatus:DEAL_STATUS_WAITCHECKSUCCESS];
    RequestListViewController *vc = [[RequestListViewController alloc] init];
    vc.listArray = listArray;
    vc.personClass = PERSONCLASS_MANAGE;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
