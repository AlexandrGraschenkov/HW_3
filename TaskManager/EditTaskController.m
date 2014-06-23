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

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //заполняем данными из Task
    //у кнопок есть свойство selected, оно тут  пригодится
    [self.titleTask setText:[self.task title]];
    [self.description setText:[self.task desc]];
    [self.slider setValue: [self.task complete]];
    [self.isMarked setSelected:[self.task marked]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //сохраняем изменение Task
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [self.task setMarked:sender.selected];
}

    - (void)textFieldDidEndEditing:(UITextField *)textField
    {
        [self.task setTitle:[textField text]];
    }

    - (void)textViewDidEndEditing:(UITextView *)textView
    {
        [self.task setDesc:[textView text]];
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
   
     [self.task setComplete:(int)self.slider.value];
   
}

@end
