//
//  CommandDataService.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "BasicManagedObjectContext.h"
#import "CommandModel.h"
@interface CommandDataService : BasicManagedObjectContext

+ (CommandDataService *)shareData;


//增加一个需求
- (void)insertACommandCommandModel:(NSDictionary *)commandDict;

//根据状态查询待处理列表
- (NSArray *)queryCommandListDealStatus:(DEAL_STATUS)dealStatus;

//删除需求  项目中未使用
- (void)deleteACommandCommandModel:(CommandModel *)commandModel;

////通过需求id来处理需求  项目中未使用
- (void)updateACommandCommandModel:(CommandModel *)commandModel;

- (NSString *)statusStr:(NSString *)status;

@end
