//
//  main.m
//  RandomPossessions
//
//  Created by Joseph Baldwin on 12/27/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
    // Create a mutable array object, store its address in items variable
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    // Send the messafe addObject: to the NSMutableArray pointed to
    // by the variable items, passing a string each time.
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];

        
        //send another message, insertObject: atIndex:, to that same array object
        [items insertObject:@"Zero" atIndex:0];
        
        
        items = nil;
    }
    return 0;
}

