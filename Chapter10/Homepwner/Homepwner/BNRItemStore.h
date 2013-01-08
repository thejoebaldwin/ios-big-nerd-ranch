//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Joseph on 1/7/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

- (void)moveItemAtIndex:(int) from toIndex:(int) to;

// Notice that this is a class method and prefixed weith a + instead of a -
+ (BNRItemStore *)sharedStore;

- (void) removeItem:(BNRItem *)p;

- (NSArray *)allItems;
- (BNRItem *)createItem;

@end

