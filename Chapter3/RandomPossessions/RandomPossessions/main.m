//
//  main.m
//  RandomPossessions
//
//  Created by Joseph Baldwin on 12/27/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
    // Create a mutable array object, store its address in items variable
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    // Send the messafe addObject: to the NSMutableArray pointed to
    // by the variable items, passing a string each time.
        //[items addObject:@"One"];
        //[items addObject:@"Two"];
        //[items addObject:@"Three"];

        
        //send another message, insertObject: atIndex:, to that same array object
        //[items insertObject:@"Zero" atIndex:0];
        
        
        for (int i = 0; i < 10; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }
        
        
        
        // For every item in the array as determined by sending count to items
        //for (int i = 0; i < [items count]; i++)
        //{
            // We get the ith bject from the array and pass it as an argument to
            // NSLog, which implicitly sends the description message to that object
            //NSLog(@"%@", [items objectAtIndex:i]);
        //}
        
        // use fast enumeration
        for (BNRItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        //BNRItem *p = [[BNRItem alloc] init];
        // This creates a new NSString, "Red Sofa" and gives it to the BNRItem
        //[p setItemName:@"Red Sofa"];
        
        // This creates a new NSString, "A12BC" and gives it to the BNRItem
        //[p setSerialNumber: @"A12BC"];
        
        //We send the value 100 to be used as the valueInDollars of this BNRItem
        //[p setValueInDollars:100];
        //BNRItem *p = [[BNRItem alloc] initWithItemName:@"Red Sofa"
          //                              valueInDollars:100
            //                              serialNumber:@"A12BC"];
         
        
        //NSLog(@"%@ %@ %@ %d", [p itemName], [p dateCreated], [p serialNumber], [p valueInDollars]);
        //NSLog(@"%@", p);
        
        
        items = nil;
    }
    return 0;
}

