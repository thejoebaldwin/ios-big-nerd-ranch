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
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}


- (id) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


@end
