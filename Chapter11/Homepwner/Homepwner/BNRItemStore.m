//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Joseph on 1/7/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

- (void) moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    // Get pointer to object being moved so we can re-insert it
    BNRItem *p = [allItems objectAtIndex:from];
    
    // Remove p from array
    [allItems removeObjectAtIndex:from];
    
    // Inser p in array at new location
    [allItems insertObject:p atIndex:to];
}

- (void) removeItem:(BNRItem *)p
{
    [allItems removeObjectIdenticalTo:p];
}

- (BNRItem *) createItem
{
    BNRItem *p = [BNRItem randomItem];
    [allItems addObject:p];
    return p;
}

- (id) init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems
{
    return allItems;
}

+ (BNRItemStore *) sharedStore
{
    static BNRItemStore * sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    return sharedStore;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

@end
