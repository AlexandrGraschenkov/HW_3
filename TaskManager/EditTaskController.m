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
@property (weak, nonatomic) IBOutlet UIButton *markButton;
@property (weak, nonatomic) IBOutlet UITextView *taskDescTextView;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UISlider *taskCompletionSlider;
@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_markButton setSelected:[_task marked]];
    [_taskNameTextField setText:[_task title]];
    [_taskNameTextField becomeFirstResponder];
    [_taskDescTextView setText:[_task desc]];
    [_taskCompletionSlider setValue:[_task complete] animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [_task setMarked:sender.selected];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_task setTitle:[textField text]];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
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

- (IBAction)changeCompletion:(id)sender {
    [_task setComplete:(int)_taskCompletionSlider.value];
}

@end
