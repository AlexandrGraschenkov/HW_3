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

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextView *taskDescription;
@property (weak, nonatomic) IBOutlet UISlider *taskProgress;
@property (weak, nonatomic) IBOutlet UIButton *taskMarked;

@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_taskTitle setText:[_task title]];
    [_taskDescription setText:[_task desc]];
    [_taskProgress setValue:[_task complete]];
    [_taskMarked setSelected:[_task marked]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [_task setMarked:sender.selected];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_task setTitle:[textField text]];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_task setDesc:[textView text]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (IBAction)changeCompletion:(id)sender {
    [_task setComplete:(int)_taskProgress.value];
}

@end
