//
//  BNRItem.h
//  RandomPossessions
//
//  Created by Joseph Baldwin on 12/27/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

+ (id) randomItem;

- (id) initWithItemName: (NSString *) name
                    valueInDollars: (int) value
                    serialNumber: (NSString *) sNumber;


- (void) setItemName: (NSString *) str;
- (NSString *) itemName;

- (void) setSerialNumber: (NSString *) str;
- (NSString *) serialNumber;

- (void) setValueInDollars: (int) i;
- (int) valueInDollars;

- (NSDate *) dateCreated;


@end
