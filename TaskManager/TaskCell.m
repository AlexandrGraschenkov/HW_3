//
//  TaskCell.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "TaskCell.h"
#import "Task.h"

@interface TaskCell()

@property (weak, nonatomic) IBOutlet UIView *taskProgress;
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDescription;
@property (weak, nonatomic) IBOutlet UIImageView *taskMarked;

@end

@implementation TaskCell

- (void)setTask:(Task *)task
{
    _task = task;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width * (((float)_task.complete) / 100), _taskProgress.frame.size.height);
    [_taskProgress setFrame:frame];
    [_taskTitle setText:[_task title]];
    [_taskDescription setText:[_task desc]];
    [_taskMarked setHidden:![_task marked]];
}

@end
