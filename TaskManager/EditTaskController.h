//
//  EditTaskController.h
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;
@interface EditTaskController : UIViewController
@property (nonatomic, strong) Task* task;
@end
