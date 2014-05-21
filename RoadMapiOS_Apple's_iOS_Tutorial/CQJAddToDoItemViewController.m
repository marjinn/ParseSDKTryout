//
//  CQJAddToDoItemViewController.m
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQJAddToDoItemViewController.h"

@interface CQJAddToDoItemViewController ()

@end

@implementation CQJAddToDoItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != [self doneButtonClicked]) {
        return;
    }
    
    if ([[[self textField]text]length] > 0) {
        
        [self setToDoItem:(CQJToDoItem *)[[CQJToDoItem alloc]init]];
        
        [[self toDoItem]setItemName:[[self textField] text]];
        
        [[self toDoItem]setCompleted:NO];
    }
}

@end
