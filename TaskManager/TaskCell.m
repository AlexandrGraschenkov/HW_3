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

@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *starPlace;
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel *taskDesc;

@end

@implementation TaskCell

- (void)setTask:(Task *)task
{
    _task = task;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width * (((float)_task.complete) / 100), _progressView.frame.size.height);
    [_progressView setFrame:frame];
    if (_task.marked)
    {
        _starPlace.image = [UIImage imageNamed:@"star.png"];
    }
    _taskTitle.text = _task.title;
    _taskDesc.text = _task.desc;
}

@end
