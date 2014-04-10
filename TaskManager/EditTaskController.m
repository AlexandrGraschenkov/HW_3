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
@end

@implementation EditTaskController{
    IBOutlet UITextField *tittleTask;
    IBOutlet UISlider *completeSlider;
    IBOutlet UIButton *isCompleted;
    IBOutlet UITextView *taskDescription;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tittleTask.text=[_task title];
    isCompleted.selected=[_task marked];
    completeSlider.value=[_task complete];
    taskDescription.text=[_task desc];
    //заполняем данными из Task
    //у кнопок есть свойство selected, оно тут  пригодится
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //сохраняем изменение Task
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
    _task.marked=sender.selected;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //выходим из режима редактирования
    [textField resignFirstResponder];
    _task.title=textField.text;
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [_task setDesc:[textView text]];
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
-(IBAction)changeProgress:(id)sender {
    [_task setComplete:(int)completeSlider.value];
}

@end
