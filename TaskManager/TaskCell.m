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
    __weak IBOutlet UILabel *taskTitleWeak;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UIImageView *favourite;
    __weak IBOutlet UIProgressView *progressiveView;
}

- (id)init {
    self = [super init];
    if (self) {
        [favourite setHidden:YES];
    }
    return self;
}


#define PROCENT_MAX_COUNTER 100

- (void)setTask:(Task *)task
{
    _task = task;
    [progressiveView setProgress:(float)[_task complete]/PROCENT_MAX_COUNTER];
    [descriptionLabel setText:[_task desc]];
    [favourite setHighlighted:[_task marked]];
    [taskTitleWeak setText:[_task title]];
}

@end
