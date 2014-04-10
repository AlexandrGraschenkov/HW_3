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

@implementation TaskCell{
    IBOutlet UILabel *taskTitle;
    IBOutlet UIImageView *isMarked;
    IBOutlet UIView *progress;
}

-(id)init{
    self=[super init];
    if(self){
        isMarked.hidden=true;
        
    }
    return self;
}
- (void)setTask:(Task *)task
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width * (((float)_task.complete)/100), progress.frame.size.height);
    [progress setFrame:frame];
    _task = task;
    isMarked.hidden=!_task.marked;
    taskTitle.text=_task.title;
}

@end
