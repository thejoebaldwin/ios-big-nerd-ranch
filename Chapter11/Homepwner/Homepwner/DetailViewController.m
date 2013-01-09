//
//  DetailViewController.m
//  Homepwner
//
//  Created by Joseph Baldwin on 1/8/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"

@implementation DetailViewController

@synthesize item;


- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [[ self view] endEditing:YES];
    
    // "Save" changed to item
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
}

- (void) setItem:(BNRItem *) i
{
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    // Use a filtered NSDarte object to set dateLabel contents
    [dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];
    
    
    
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewDidUnload {
    nameField = nil;
    serialNumberField = nil;
    valueField = nil;
    dateLabel = nil;
    [super viewDidUnload];
}
@end
