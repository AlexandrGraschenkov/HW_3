//
//  TaskManager.h
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskManager : NSObject
+ (instancetype)sharedInstance;
- (void)addTask:(Task*)task;
- (void)deleteTask:(Task*)task;
- (void)taskChanged:(Task*)task;
- (Task *)getTaskAtIndex:(int)index;
@property (nonatomic, strong, readonly) NSArray* tasks;
@end
