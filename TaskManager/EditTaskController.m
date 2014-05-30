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
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UISlider *scrollBar;
@property (weak, nonatomic) IBOutlet UIButton *isMarked;
@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_isMarked setSelected:[_task marked]];
    [_inputField setText:[_task title]];
    [_inputField becomeFirstResponder];
    [_textField setText:[_task desc]];
    [_scrollBar setValue:[_task complete] animated:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //сохраняем изменение Task
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
//        [_task setTitle:textView.text];
        return NO;
    }
    
    return YES;
}



-(IBAction)markPressed:(UIButton*)sender
{
    NSLog(@"Marked as pressed");
    sender.selected = !sender.selected;
    [_task setMarked:sender.selected];
}

- (void)textFieldDidEndEditing:(UITextField *)customTextField {
    NSLog(@"I've just finished editing text #1");
    [_task setTitle:[customTextField text]];
}

- (void)textViewDidEndEditing:(UITextView *)customTextView {
    [_task setDesc:[customTextView text]];
}



- (IBAction)changeCompletion:(id)sender {
    [_task setComplete:(int)_scrollBar.value];
}

@end
