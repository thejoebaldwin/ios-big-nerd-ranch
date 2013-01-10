//
//  ListViewController.h
//  Nerdfeed
//
//  Created by Joseph Baldwin on 1/9/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListViewController : UITableViewController
{
    NSURLConnection *connection;
    NSMutableData *xmlData;
}

- (void) fetchEntries;

@end
