//
//  Task.h
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* desc;
@property (nonatomic, assign) BOOL marked;
@property (nonatomic, assign) int complete;
@end
