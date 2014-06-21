//
//  EditTaskController.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "EditTaskController.h"
#import "Task.h"

@interface EditTaskController () <UITextFieldDelegate, UITextViewDelegate>

@property(nonatomic, weak) IBOutlet UITextField *taskTitle;
@property(nonatomic, weak) IBOutlet UITextView *taskDescription;
@property(nonatomic, weak) IBOutlet UISlider *taskProgress;
@property(nonatomic, weak) IBOutlet UIButton *taskMarked;

@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //заполняем данными из Task
    //у кнопок есть свойство selected, оно тут  пригодится
    [_taskTitle setText:[_task title]];
    [_taskDescription setText:[_task desc]];
    [_taskProgress setValue:[_task complete]];
    [_taskMarked setSelected:[_task marked]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //сохраняем изменение Task
}

- (IBAction)markPressed:(UIButton*)sender
{
    NSLog(@"%hhd",sender.selected);
    sender.selected = !sender.selected;
    [_task setMarked:sender.selected];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",[textField text]);
    [_task setTitle:[textField text]];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_task setDesc:[textView text]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //выходим из режима редактирования
    [textField resignFirstResponder];
    return YES;
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //выходим из режима редактирования
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)changeCompletion:(id)sender
{
    [_task setComplete:(int)_taskProgress.value];
}

@end
