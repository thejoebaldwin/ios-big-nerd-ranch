//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Joseph on 1/7/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController


- (void) tableView:(UITableView *) aTableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = [items objectAtIndex: [indexPath row]];
    
    // Give detail view controller a pointer to the item object in row
    [detailViewController setItem:selectedItem];
    
    // Push it onto the top of the navigation controller's stack
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

- (void) tableView:(UITableView *) tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

- (void) tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        
        // We also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction) addNewItem:(id)sender
{
    // Make a new index path for the 0th section, last row
    //int lastRow = [[self tableView] numberOfRowsInSection:0];
    
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    // Figure out where that item i in the array
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // Insert this new row into the table
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}


- (IBAction) toggleEditingMode:(id)sender
{
    // If we are currently in editing mode...
    if ([self isEditing]) {
        // Change text of button to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // Turn off editing mode
        [self setEditing:NO animated:YES];
    }
    else {
        // Change text of button to indorm user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        // Enter editing mode
        [self setEditing:YES animated:YES];
    }
}

- (UIView *) tableView:(UITableView *) tv viewForHeaderInSection:(NSInteger)sec
{
    return [self headerView];
}

- (CGFloat) tableView:(UITableView *) tv heightForHeaderInSection:(NSInteger)sec
{
    // The height of the header view should be determined from the height of
    // the view in the XIB file
    return [[self headerView] bounds].size.height;
    
}

- (UIView *)headerView
{
    // If we haven't loaded the headerView yet....
    if (!headerView) {
        // Load HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return headerView;
}

- (NSInteger) tableView: (UITableView *) tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // check for a reusable cell first, use that if it exists
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    //If there is no reusable cell fo this type, create a new one
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    BNRItem *p = [[[BNRItemStore sharedStore] allItems]
                  objectAtIndex: [indexPath row]];
    [[cell textLabel] setText:[p description]];
    
    return cell;
}


- (id) init
{
    // Call the superclass's designate initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        //for (int i = 0; i < 5; i++) {
        //    [[BNRItemStore sharedStore] createItem];
        //}
    }
    return self;
}


- (id) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


@end
