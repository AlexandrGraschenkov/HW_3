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
@end

@implementation TaskCell

- (void)setTask:(Task *)task
{
    _task = task;
    CGRect frame = CGRectMake(0,0, self.frame.size.width * (((float)_task.complete)/50), _taskSlider.frame.size.height);
       [_taskSlider setFrame:frame];
        [_taskTitle setText:[_task title]];
        [_taskBody setText:[_task desc]];
        [_taskMark setHidden:![_task marked]];
    [_taskSlider setUserInteractionEnabled:NO];
    [_taskBody setBackgroundColor:[UIColor colorWithRed:0.810 green:0.207 blue:0.143 alpha:0.108]];
}

@end
