//
//  EditTaskController.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "EditTaskController.h"
#import "TaskManager.h"

@interface EditTaskController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descView;
@property (weak, nonatomic) IBOutlet UISlider *completeSlider;
@property (weak, nonatomic) IBOutlet UIButton *markButton;

@end

@implementation EditTaskController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _titleLabel.text = _task.title;
    _descView.text = _task.desc;
    _completeSlider.value = _task.complete;
    _markButton.selected = _task.marked;
    [_titleLabel setDelegate:self];
    [_descView setDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    _task.title = _titleLabel.text;
    _task.desc = _descView.text;
    _task.complete = _completeSlider.value;
    _task.marked = _markButton.selected;
    [[TaskManager sharedInstance] taskChanged:_task];
    [super viewWillDisappear:animated];
}

- (IBAction)markPressed:(UIButton*)sender
{
    sender.selected = !sender.selected;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
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

@end
