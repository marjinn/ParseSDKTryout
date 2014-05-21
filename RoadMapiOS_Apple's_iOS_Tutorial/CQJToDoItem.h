//
//  CQJToDoItem.h
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/28/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQJToDoItem : NSObject
{
    @public
    NSString* itemName;
    BOOL completed;
    NSDate* creationDate;
    
}

@property(nonatomic,retain)NSString* itemName;
@property(nonatomic,assign)BOOL completed;
@property(nonatomic,retain,readonly)NSDate* creationDate;

-(void)markAsCompleted:(BOOL)isComplete onDate:(NSDate *)date;
@end
