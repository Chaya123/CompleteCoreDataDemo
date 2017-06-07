//
//  TableViewCell.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommandModel;
@interface TableViewCell : UITableViewCell


+ (TableViewCell *)cellWithTableView:(UITableView *)tableView;


@property(nonatomic,strong) CommandModel *commandModel;

@end
