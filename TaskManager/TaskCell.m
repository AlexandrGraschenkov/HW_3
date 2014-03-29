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

@implementation TaskCell {
    __weak IBOutlet UILabel *taskTitle;
    __weak IBOutlet UIImageView *markImage;
}

- (id)init {
    self = [super init];
    if (self) {
        [markImage setHidden:YES];
    }
    return self;
}

- (void)setTask:(Task *)task
{
    _task = task;
    [markImage setHidden:![_task marked]];
    [taskTitle setText:[_task title]];
}

@end
