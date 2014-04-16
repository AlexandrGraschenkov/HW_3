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
@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UIImageView *mark;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@end

@implementation TaskCell

- (void)setTask:(Task *)task
{
    _task = task;
    //обновляем данные в ячейке
    CGRect frame = CGRectMake(0, 0, self.frame.size.width * (((float)_task.complete) / 100), _cellView.frame.size.height);
    UIView *completeView = [[UIView alloc]initWithFrame:frame];
    completeView.backgroundColor = [UIColor blueColor];
    completeView.opaque = NO;
    [_cellView addSubview: completeView];
       if (_task.marked)
        
            {
                _mark.image = [UIImage imageNamed:@"star.png"];
            
            }
       _title.text = _task.title;
       _desc.text = _task.desc;

}

@end
