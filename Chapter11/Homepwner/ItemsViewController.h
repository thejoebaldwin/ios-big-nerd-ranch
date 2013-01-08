//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Joseph on 1/7/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DetailViewController.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewItem:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end
