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
