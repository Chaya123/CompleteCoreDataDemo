//
//  RequestListViewController.h
//  LcjInterViewDemo
//
//  Created by liu on 2017/6/4.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    PERSONCLASS_DEV,
    PERSONCLASS_OPERATOR,
    PERSONCLASS_MANAGE
} PERSONCLASS;

@interface RequestListViewController : UIViewController

@property(nonatomic,strong) NSArray *listArray;

@property(nonatomic,assign) PERSONCLASS personClass;

@end
