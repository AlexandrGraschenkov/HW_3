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
    __weak IBOutlet UIProgressView *progressView;
    __weak IBOutlet UILabel *descriptionLabel;
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
    [progressView setProgress:(float)[_task complete]/100];
    [descriptionLabel setText:[_task desc]];
    [markImage setHidden:![_task marked]];
    [taskTitle setText:[_task title]];
}

@end
