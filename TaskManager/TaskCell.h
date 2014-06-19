//
//  TaskCell.h
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@interface TaskCell : UITableViewCell
@property (nonatomic, strong) Task* task;
@property (weak, nonatomic) IBOutlet UILabel *taskTitle;
@property (weak, nonatomic) IBOutlet UILabel*taskBody;

@property (weak, nonatomic) IBOutlet UISlider *taskSlider;

@property (weak, nonatomic) IBOutlet UIImageView *taskMark;


@end
