//
//  RequestDealViewController.m
//  LcjInterViewDemo
//
//  Created by liu on 2017/6/4.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "RequestDealViewController.h"
#import "CommandDataService.h"
#import "CommandModel.h"

@interface RequestDealViewController ()

@property (weak, nonatomic) IBOutlet UILabel *requestLabel;

@end

@implementation RequestDealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"查询详情";
    self.requestLabel.text = [NSString stringWithFormat:@"主机用途%@处理器数量%@内存数量%@硬盘容量%@  状态:%@",self.model.useReason,self.model.processorNum,self.model.mermoryNum,self.model.solidCapacity,[[CommandDataService shareData] statusStr:self.model.dealStatus]];
}

- (void)actionBack {

    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)successButton:(UIButton *)sender {
    
    if (self.model.dealStatus.intValue == DEAL_STATUS_COMMIT) {
        
        self.model.dealStatus = [NSString stringWithFormat:@"%d",DEAL_STATUS_WAITCHECKSUCCESS];
        [[CommandDataService shareData] saveContext];
        
    }else if (self.model.dealStatus.intValue == DEAL_STATUS_WAITCHECKSUCCESS){
    
        self.model.dealStatus = [NSString stringWithFormat:@"%d",DEAL_STATUS_CHECKEDSUCCESS];
        [[CommandDataService shareData] saveContext];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)failButton:(UIButton *)sender {
    
    if (self.model.dealStatus.intValue == DEAL_STATUS_COMMIT) {
        
        self.model.dealStatus = [NSString stringWithFormat:@"%d",DEAL_STATUS_WAITCHECKFAILED];
        [[CommandDataService shareData] saveContext];
    }else if(self.model.dealStatus.intValue == DEAL_STATUS_WAITCHECKSUCCESS) {
    
        self.model.dealStatus = [NSString stringWithFormat:@"%d",DEAL_STATUS_CHECKEDFAILED];
        [[CommandDataService shareData] saveContext];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
