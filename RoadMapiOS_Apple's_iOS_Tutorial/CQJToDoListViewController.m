//
//  CQJToDoListViewController.m
//  RoadMapiOS_Apple's_iOS_Tutorial
//
//  Created by mar Jinn on 1/26/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQJToDoListViewController.h"
#import "MacroCollection.h"

#import "CQJToDoItem.h"

#include <objc/runtime.h>

#import "CQJAddToDoItemViewController.h"

@interface CQJToDoListViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *toDoItems;
@end

@implementation CQJToDoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self setValue:[[NSMutableArray alloc]init] forKey:@"toDoItems"];
    /*
     * Load Some initial data
     */
    [self loadInitialData];
}

-(void)loadInitialData
{
    /*
     * Create an a item - Item 1
     */
    CQJToDoItem* item1 = nil;
    item1 = [[CQJToDoItem alloc]init];
    /*
     * set its name
     */
    [item1 setItemName:@"Buy Milk"];
    /*
     * Add item1 to array
     */
    [[self toDoItems]addObject:item1];
    
    /*
     * Item 2
     */
    CQJToDoItem* item2 = nil;
    item2 = [[CQJToDoItem alloc]init];
    /*
     * set its name
     */
    [item2 setItemName:@"Buy eggs"];
    /*
     * Add item2 to array
     */
    [[self toDoItems]addObject:item2];
    
    /*
     * Item 3
     */
    CQJToDoItem* item3 = nil;
    item3 = [[CQJToDoItem alloc]init];
    /*
     * set its name
     */
    [item3 setItemName:@"Buy eggs"];
    /*
     * Add item3 to array
     */
    [[self toDoItems]addObject:item3];
    
    return;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self toDoItems] ? [[self toDoItems]count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    /* 
     * Create the data model object
     */
    CQJToDoItem* todoItem = nil;
    todoItem = [[self toDoItems]objectAtIndex:[indexPath row]];
    
    //Set Cells text
    [[cell textLabel]setText:[todoItem itemName]];
    
    //add check mark
    [todoItem completed] ?
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark] :
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    
    return cell;
}

#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //deselect the cell first
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //get the object at the selected indexpath
    CQJToDoItem* tappedItem = nil;
    tappedItem = [[self toDoItems]objectAtIndex:[indexPath row]];
    
    //toggle the completion state of the tapped item
    // i.e
    [tappedItem setCompleted:![tappedItem completed]];
    
    //reload the row whose data we just edited
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    
    
    return;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


#pragma mark 
#pragma mark Unwind Segue

/*
 * This method will be called another view controller as its exit method
 * i.e.  IF it wants to unwind to a particular view controller
 * the destinaton view controller has to implement this method
 */
-(IBAction)unWindToList:(UIStoryboardSegue *)segue
{
    //NSLog(@"GET_RETAIN_COUNT(segue) %ld",GET_RETAIN_COUNT(segue));
    
    GET_RETAIN_COUNT(segue);
    
//    + (instancetype)string
//    Description
//    Returns an empty string.
//    Returns
//    An empty string.
   // [NSString string];
    
//    id firstObject = @"someString";
//    id secondObject = nil;
//    id thirdObject = @"anotherString";
//    NSArray *someArray =
//    [NSArray arrayWithObjects:firstObject, secondObject, thirdObject, nil];
//    (lldb) po someArray
//    <__NSArrayI 0x89add40>(
//                           someString
//                           )

    /*
     * How to easily Sort an NSArray
     */
    NSArray *unsortedStrings = [NSArray array];
     NSLog(@"GET_RETAIN_COUNT(unsortedStrings) %ld",GET_RETAIN_COUNT(unsortedStrings));
    
    unsortedStrings = @[@"gammaString", @"alphaString", @"betaString"];
    
     NSLog(@"GET_RETAIN_COUNT(unsortedStrings) %ld",GET_RETAIN_COUNT(unsortedStrings));
    
    
    if(unsortedStrings)
    {
        fprintf(stdout,"%ld",(long)CFGetRetainCount((__bridge CFTypeRef)unsortedStrings));
        
        fprintf(stdout, "%s",class_getName([unsortedStrings class]));//objc/runtime.h
    }
    
    __unused NSArray *sortedStrings = nil;
    sortedStrings = [unsortedStrings sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"GET_RETAIN_COUNT(sortedStrings) %ld",GET_RETAIN_COUNT(sortedStrings));
    
    
    
    if ([[segue sourceViewController]
         isKindOfClass:[CQJAddToDoItemViewController class]]) {
        
        CQJAddToDoItemViewController* source = nil;
        source = ( CQJAddToDoItemViewController *)[segue sourceViewController];
        
        CQJToDoItem* item = nil;
        item = [source toDoItem];
        
        if (item) {
            
            
            [[self toDoItems]addObject:item];
            
            
            //reload tableview
            [[self tableView]reloadData];
            
        }
    }
}


@end
