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
@property (weak, nonatomic) IBOutlet UITextField *titleTask;
@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *isMarked;
- (IBAction)changeCompletion:(id)sender;
@end
