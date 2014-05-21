//
//  CQJAddToDoItemViewController.h
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQJToDoItem.h"

@interface CQJAddToDoItemViewController : UIViewController

@property CQJToDoItem* toDoItem;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButtonClicked;
@end
