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
@property (nonatomic, weak) IBOutlet UILabel *titleTask;
@property (nonatomic, weak) IBOutlet UILabel *description;
@property (nonatomic, weak) IBOutlet UIView *slider;
@property (nonatomic, weak) IBOutlet UIImageView *isMarked;

@end
