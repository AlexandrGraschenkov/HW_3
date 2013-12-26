//
//  Task.m
//  TaskManager
//
//  Created by Alexander on 23.12.13.
//  Copyright (c) 2013 Alexander. All rights reserved.
//

#import "Task.h"

@implementation Task
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.desc forKey:@"desc"];
    [encoder encodeBool:self.marked forKey:@"marked"];
    [encoder encodeInteger:self.complete forKey:@"complete"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.title = [decoder decodeObjectForKey:@"title"];
        self.desc = [decoder decodeObjectForKey:@"desc"];
        self.marked = [decoder decodeBoolForKey:@"marked"];
        self.complete = [decoder decodeIntegerForKey:@"complete"];
    }
    return self;
}
@end
