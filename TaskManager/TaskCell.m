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

@property(nonatomic, weak) IBOutlet UILabel *taskTitle;
@property(nonatomic, weak) IBOutlet UILabel *taskDescription;
@property(nonatomic, weak) IBOutlet UIProgressView *taskProgress;
@property(nonatomic, weak) IBOutlet UIImageView *taskMarked;

@end

@implementation TaskCell

- (void)setTask:(Task *)task
{
    _task = task;
    //обновляем данные в ячейке
    [_taskTitle setText:[_task title]];
    [_taskDescription setText:[_task desc]];
    [_taskMarked setHidden:![_task marked]];
    NSLog(@"%d",[task complete]/100);
    [_taskProgress setProgress:[_task complete]/100];
}

@end
