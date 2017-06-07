//
//  CommandModel.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <CoreData/CoreData.h>

typedef enum{
    
    DEAL_STATUS_ALL = 1, //查询所有需求列表
    DEAL_STATUS_COMMIT=2, //提交需求信息
    DEAL_STATUS_WAITCHECKSUCCESS=3,//提交审批通过
    DEAL_STATUS_WAITCHECKFAILED=4,//提交审批否决
    DEAL_STATUS_CHECKEDSUCCESS=5,//审批通过结束
    DEAL_STATUS_CHECKEDFAILED=6//审批否决结束
}DEAL_STATUS;

@interface CommandModel : NSManagedObject

@property(nonatomic,strong) NSString *useReason;/**<主机用途*/

@property(nonatomic,strong) NSString *processorNum;/**<处理器数量*/

@property(nonatomic,strong) NSString *mermoryNum;/**<内存数量*/

@property(nonatomic,strong) NSString *solidCapacity;/**<硬盘容量*/

@property(nonatomic,strong) NSString *dealStatus;/**<需求状态*/

@end
