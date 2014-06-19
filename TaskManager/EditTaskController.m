//
//  EditTaskController.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "EditTaskController.h"
#import "Task.h"
#import "TaskManager.h"

@interface EditTaskController () <UITextFieldDelegate, UITextViewDelegate>
@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //заполняем данными из Task
    //у кнопок есть свойство selected, оно тут  пригодится
    [_taskTitle setText:[_task title]];
    [_taskBody setText:[_task desc]];
    [_taskSlider setValue: [_task complete]];
    [_taskMark setSelected:[_task marked]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[[TaskManager sharedInstance] taskChanged:_task];
   
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [_task setMarked:sender.selected];
    //[_taskMark setSelected:sender.selected];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    

    [_task setTitle:textField.text];
   
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    [_task setDesc:textView.text];
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
    [_task setComplete:(int)_taskSlider.value];
}
@end
