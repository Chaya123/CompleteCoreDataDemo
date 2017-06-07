//
//  BasicManagedObjectContext.h
//  CompleteCoreDataDemo
//
//  Created by liu on 2017/6/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BasicManagedObjectContext : NSObject

@property(readonly,nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property(readonly,nonatomic,strong) NSManagedObjectModel *managedObjectModel;

@property(readonly,nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (BasicManagedObjectContext *)shareData;

- (void)saveContext;

@end
