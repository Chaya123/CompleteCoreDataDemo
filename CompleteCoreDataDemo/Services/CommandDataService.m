//
//  CommandDataService.m
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "CommandDataService.h"
#import "AppDelegate.h"

@implementation CommandDataService

+ (CommandDataService *)shareData {

    static CommandDataService *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CommandDataService alloc] init];
    });
    return sharedInstance;
}

//增加一个需求
- (void)insertACommandCommandModel:(NSDictionary *)commandDict {

    CommandModel *model = [NSEntityDescription insertNewObjectForEntityForName:@"CommandClass" inManagedObjectContext:self.managedObjectContext];
    model.useReason = [commandDict objectForKey:@"useReason"];
    model.processorNum = [commandDict objectForKey:@"processorNum"];
    model.mermoryNum = [commandDict objectForKey:@"mermoryNum"];
    model.solidCapacity = [commandDict objectForKey:@"solidCapacity"];
    model.dealStatus = [commandDict objectForKey:@"dealStatus"];
    
    [self saveContext];
}

//根据状态查询待处理列表
- (NSArray *)queryCommandListDealStatus:(DEAL_STATUS)dealStatus {

    if (!dealStatus) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CommandClass" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    if (dealStatus != DEAL_STATUS_ALL) {
        
        NSPredicate *predicate= [NSPredicate predicateWithFormat:@"dealStatus == %@",[NSString stringWithFormat:@"%d",dealStatus]];
        [fetchRequest setPredicate:predicate];
    }
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects.count == 0) {
        return nil;
    }
    return fetchedObjects;
}

//删除需求
- (void)deleteACommandCommandModel:(CommandModel *)commandModel {

    if(commandModel){
    
        NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"CommandClass" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        //可以根据属性唯一值去查找，也可以根据coredata自动生成的id查询NSManagedObjectID *moID = [managedObject objectID];  或者多个匹配
//        NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"userId == %@", userId];
//        NSPredicate *statusPredicate = [NSPredicate predicateWithFormat:@"uploadStatus <> %d", status];
//        NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:userPredicate, statusPredicate, nil]];
//        [fetchRequest setPredicate:predicate];
        
        NSPredicate *predicate= [NSPredicate predicateWithFormat:@" useReason== %@",commandModel.useReason];
        [fetchRequest setPredicate:predicate];
        NSError *error = nil;
        NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        for (CommandModel *model in fetchedObjects) {
            [self.managedObjectContext deleteObject:model];
        }
    }
}

- (void)updateACommandCommandModel:(CommandModel *)commandModel {

    if (commandModel) {
        
        NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"CommandClass" inManagedObjectContext:self.managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSPredicate *predicate= [NSPredicate predicateWithFormat:@" useReason== %@",commandModel.useReason];
        [fetchRequest setPredicate:predicate];
        
        NSError *error = nil;
        NSArray *uploadArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
 
        [uploadArray enumerateObjectsUsingBlock:^(CommandModel *model, NSUInteger idx, BOOL *stop) {
            
            model.useReason = commandModel.useReason;
            model.dealStatus = commandModel.dealStatus;
            model.solidCapacity = commandModel.solidCapacity;
            model.mermoryNum = commandModel.mermoryNum;
            model.processorNum = commandModel.processorNum;
            
        }];
            
            [self saveContext];
        }
}

- (NSString *)statusStr:(NSString *)status {
    
    switch ([status intValue]) {
        case DEAL_STATUS_COMMIT:
            return @"开发成员提交状态";
            break;
        case DEAL_STATUS_WAITCHECKSUCCESS:
            return @"运维成员审批通过状态";
            break;
        case DEAL_STATUS_WAITCHECKFAILED:
            return @"运维成员审批否决状态";
            break;
        case DEAL_STATUS_CHECKEDSUCCESS:
            return @"管理成员审批通过状态";
            break;
        case DEAL_STATUS_CHECKEDFAILED:
            return @"管理成员审批否决状态";
            break;
            
        default:
            return @"";
            break;
    }
}
@end
