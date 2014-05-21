//
//  CQJToDoItem.m
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/28/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQJToDoItem.h"

@interface CQJToDoItem()
{
    @private
    NSDate* completionDate;
}

@property(nonatomic,retain,readwrite)NSDate* completionDate;

@end

@implementation CQJToDoItem
@synthesize itemName;
@synthesize completed;
@synthesize creationDate;

@synthesize completionDate;

-(void)markAsCompleted:(BOOL)isComplete onDate:(NSDate *)date
{
    [self setCompleted:isComplete];
    
    [self setCompletionDate];
    return;
}

-(void)setCompletionDate
{
    if ([self completed])
    {
        [self setCompletionDate:[NSDate date]];
    }
    else
    {
        [self setCompletionDate:nil];
    }
}



@end
