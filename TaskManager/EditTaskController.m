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
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UISlider *complete;
@property (weak, nonatomic) IBOutlet UIButton *markedButton;
@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    _titleLabel.text = _task.title;
    _desc.text = _task.desc;
    _complete.value = _task.complete;
    _markedButton.selected = _task.marked;
    [_titleLabel setDelegate:self];
    [_desc setDelegate:self];
    
    //у кнопок есть свойство selected, оно тут  пригодится
}

- (void)viewWillDisappear:(BOOL)animated
{
    if(!_task) {
        _task = [Task new];
    }
    
    _task.title = _titleLabel.text;
    _task.desc = _desc.text;
    _task.complete = _complete.value;
    _task.marked = _markedButton.selected;
    NSLog(@"title: %@",_titleLabel.text);
    NSLog(@"title: %@",_task.title);
    [[TaskManager sharedInstance]taskChanged:_task];
    [super viewWillDisappear:animated];
    //сохраняем изменение Task
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
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

- (IBAction)markedButton:(id)sender {
}
@end
