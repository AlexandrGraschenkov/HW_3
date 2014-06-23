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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(editingTask){
        [taskManager taskChanged:editingTask];
        editingTask = nil;
    }
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditTaskController* editTaskController = segue.destinationViewController;
    if([segue.identifier isEqual:@"addTask"]){
        editingTask = [[Task alloc] init];
        [taskManager addTask:editingTask];
        editTaskController.task = editingTask;
    } else if([segue.identifier isEqual:@"editTask"]){
        int idx = self.tableView.indexPathForSelectedRow.row;
        editingTask = taskManager.tasks[idx];
        editTaskController.task = editingTask;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return taskManager.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //в визуальном представлении надо незабыть задать индетификатор для ячейки
    static NSString *CellIdentifier = @"TaskCell";
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
    cell.task = [taskManager.tasks objectAtIndex:indexPath.row];
    if (cell.task.marked){
        cell.isMarked.image = [UIImage imageNamed:@"star.png"];
    }
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
        Task *t = [taskManager.tasks objectAtIndex:indexPath.row];
             [taskManager deleteTask:t];
             [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

@end
