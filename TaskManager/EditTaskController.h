//
//  EditTaskController.h
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;
@interface EditTaskController : UIViewController
@property (nonatomic, strong) Task* task;

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextView *taskBody;

@property (weak, nonatomic) IBOutlet UISlider *taskSlider;

@property (weak, nonatomic) IBOutlet UIButton *taskMark;
- (IBAction)changeCompletion:(id)sender;
@end
