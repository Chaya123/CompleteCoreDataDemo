//
//  DevInsertCommandVC.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "DevInsertCommandVC.h"
#import "CommandModel.h"
#import "CommandDataService.h"

@interface DevInsertCommandVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *useResonField;/**<主机用途*/

@property (weak, nonatomic) IBOutlet UITextField *processorNumField;/**<处理器数量*/

@property (weak, nonatomic) IBOutlet UITextField *mermoryNumField;/**<内存数量*/

@property (weak, nonatomic) IBOutlet UITextField *solidCapacityField;/**<硬盘容量*/

@property (weak, nonatomic) IBOutlet UIButton *commitButton;/**<提交按钮*/

@end

@implementation DevInsertCommandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self refreshButtonStatus];
    self.useResonField.delegate = self;
    self.processorNumField.delegate = self;
    self.mermoryNumField.delegate = self;
    self.solidCapacityField.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [self.view endEditing:YES];
    return YES;
}

- (void)refreshButtonStatus {

    if (self.useResonField.text.length > 0 && self.processorNumField.text.length > 0 && self.mermoryNumField.text.length > 0 && self.solidCapacityField.text.length > 0) {
        
        self.commitButton.backgroundColor = [UIColor redColor];
        self.commitButton.enabled = YES;
    }else {
    
        self.commitButton.backgroundColor = [UIColor lightGrayColor];
        self.commitButton.enabled = NO;
    }
}
- (IBAction)useTextFieldValueChanged:(UITextField *)sender {
    [self refreshButtonStatus];
}

- (IBAction)processorTextFieldValueChanged:(UITextField *)sender {
    [self refreshButtonStatus];
}

- (IBAction)mermoryTextFieldValueChanged:(UITextField *)sender {
    [self refreshButtonStatus];
}

- (IBAction)solidTextFieldValueChanged:(UITextField *)sender {
    [self refreshButtonStatus];
}



- (IBAction)commitCommand:(UIButton *)sender {
    
    NSDictionary *dict = @{@"useReason":self.useResonField.text,@"processorNum":self.processorNumField.text,@"mermoryNum":self.mermoryNumField.text,@"solidCapacity":self.solidCapacityField.text,@"dealStatus":[NSString stringWithFormat:@"%d",DEAL_STATUS_COMMIT]};
    [[CommandDataService shareData] insertACommandCommandModel:dict];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
