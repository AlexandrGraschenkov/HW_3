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
//{
//    IBOutlet UILabel *titleTask;
//    IBOutlet UIImageView *isMarked;
//    IBOutlet UIView *slider;
//    }

-(id)init{
     self=[super init];
     if(self){
         _isMarked.hidden=true;
     }
     return self;
    }


- (void)setTask:(Task *)task
{
    _task = task;
    //обновляем данные в ячейке
    CGRect frame = CGRectMake(40, 10, self.frame.size.width * (((float)self.task.complete) / 100), self.slider.frame.size.height);
    [self.titleTask setText:[self.task title]];
    [self.description setText:[self.task desc]];
    [self.slider setFrame:frame];
    [self.isMarked setHidden:![self.task marked]];
    
}

@end
