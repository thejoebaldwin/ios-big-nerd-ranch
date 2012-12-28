//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Joseph Baldwin on 12/27/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}

- (id) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    //call the superclass's designated initializer
    self = [super init];
    
    //Did the superclass's designated initializer succeed?
    if (self) {
        // Give the insantce variables intial values
        [self setItemName:name];
        [self setSerialNumber: sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    //return the address of the newly created ob
    return self;
    
}

- (void) setContainedItem:(BNRItem *)i
{
    containedItem = i;
    
    // when gvben an item to contain, the contained item will be given a pointer to its container
    [i setContainer:self];
}

//- (BNRItem *) containedItem
//{
//    return containedItem;
//}

//- (void) setContainer: (BNRItem *) i
//{
//    container = i;
//}

//- (BNRItem *) container
//{
//    return container;
//}


+ (id) randomItem
{
    //Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                                            @"Rusty",
                                                            @"Shiny", nil];
    
    //create an array of three nouins
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                                                        @"Spork",
                                                        @"Mac", nil];
    
    //Get the index of a random adjective/noi from thje lists
    //Note: the %operator, called the modulo operator,
    //gives you the remainder. so adjectiveIndex is a random number
    //from 0 to 2 inclusive
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    //Note that NSInteger is not an object, but a type definition
    // for "unsigned long"
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                             [randomAdjectiveList objectAtIndex:adjectiveIndex],
                             [randomNounList objectAtIndex: nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() %10,
                                    'A' + rand() %26,
                                    '0' + rand() %10,
                                    'A' + rand() %26,
                                    '0' + rand() %10];

    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                     valueInDollars:randomValue
                     serialNumber:randomSerialNumber];
    return newItem;
}


- (id) init
{
    return [self initWithItemName:@"Item"
                   valueInDollars:0
                     serialNumber:@""];
    
}

//- (void) setItemName:(NSString *)str
//{
//    itemName = str;
//}

//- (NSString *) itemName
//{
//    return itemName;
//}

@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;

//- (void) setSerialNumber:(NSString *)str
//{
//    serialNumber = str;
//}

//- (NSString *) serialNumber
//{
//    return serialNumber;
//}

//- (void) setValueInDollars:(int)i
//{
//    valueInDollars = i;
//}

//- (int) valueInDollars
//{
//    return valueInDollars;
//}

//- (NSDate *) dateCreated
//{
//    return dateCreated;
//}

- (NSString *) description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat: @"%@ (%@): Worth $%d, recorded on %@",
                 itemName,
                serialNumber,
               valueInDollars,
     dateCreated];
    return descriptionString;
}

    

@end
