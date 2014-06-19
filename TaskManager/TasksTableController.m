//
//  TasksTableController.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "TasksTableController.h"
#import "TaskManager.h"
#import "EditTaskController.h"
#import "TaskCell.h"

@interface TasksTableController ()
{
    TaskManager* taskManager;
    Task* editingTask;
}
@end

@implementation TasksTableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = YES;
    
    
   taskManager = [TaskManager sharedInstance];
   // NSLog(@"123");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(editingTask){
        [[TaskManager sharedInstance] taskChanged:editingTask];
        editingTask = nil;
    }
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditTaskController* editTaskController = segue.destinationViewController;
    if([segue.identifier isEqual:@"addTask"]){
        editingTask = [[Task alloc] init];
        [[TaskManager sharedInstance] addTask:editingTask];
        editTaskController.task = editingTask;
    } else if([segue.identifier isEqual:@"editTask"]){
        int idx = self.tableView.indexPathForSelectedRow.row;
        editingTask = [TaskManager sharedInstance].tasks[idx];
        editTaskController.task = editingTask;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"Task Manager count = %d",[TaskManager sharedInstance].tasks.count);
   
    return [TaskManager sharedInstance].tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //в визуальном представлении надо незабыть задать индетификатор для ячейки
    static NSString *CellIdentifier = @"TaskCell";
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Task *task = [taskManager.tasks objectAtIndex:indexPath.row];
    if (cell == nil) {
       cell = [[TaskCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:CellIdentifier];
    }
 
    cell.task = task;
    if (task.marked == YES){
        cell.taskMark.image = [UIImage imageNamed:@"star.png"];
    }
   //NSLog(@"TASK = %@", task.title);
    //NSLog(@"TASKBODY=%@",task.desc);
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //удаляем строчку Task из данных, обновляем таблицу
        Task *task = [[TaskManager sharedInstance].tasks objectAtIndex:indexPath.row];
        [taskManager deleteTask:task];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

@end
