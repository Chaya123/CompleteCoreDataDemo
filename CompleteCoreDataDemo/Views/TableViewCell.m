//
//  TableViewCell.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "TableViewCell.h"
#import "CommandModel.h"
#import "CommandDataService.h"

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *useReasonLabel;

@property (weak, nonatomic) IBOutlet UILabel *processorNum;

@property (weak, nonatomic) IBOutlet UILabel *solidCapacityLabel;

@property (weak, nonatomic) IBOutlet UILabel *mermoryCapacity;

@property (weak, nonatomic) IBOutlet UILabel *dealStatus;

@end

@implementation TableViewCell

+ (TableViewCell *)cellWithTableView:(UITableView *)tableView; {


    static NSString *reuseIdentifer = @"reuserCell";
    UINib * nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];

    [tableView registerNib:nib forCellReuseIdentifier:reuseIdentifer];
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    
    return cell;
}

- (void)setCommandModel:(CommandModel *)commandModel {

    _commandModel = commandModel;
    self.useReasonLabel.text = commandModel.useReason;
    self.processorNum.text = commandModel.processorNum;
    self.solidCapacityLabel.text = commandModel.solidCapacity;
    self.mermoryCapacity.text = commandModel.mermoryNum;
    if (commandModel.dealStatus.intValue == DEAL_STATUS_WAITCHECKFAILED || commandModel.dealStatus.intValue == DEAL_STATUS_CHECKEDFAILED) {
        self.dealStatus.textColor = [UIColor redColor];
    }else {
    
        self.dealStatus.textColor = [UIColor darkGrayColor];
    }
    self.dealStatus.text = [[CommandDataService shareData] statusStr:commandModel.dealStatus];
}
@end
