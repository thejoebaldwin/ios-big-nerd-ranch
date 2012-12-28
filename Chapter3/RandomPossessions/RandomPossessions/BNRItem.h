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
    BNRItem *containedItem;
    __weak BNRItem *container;
    //__unsafe_unretained BNRItem *container;
}

+ (id) randomItem;

- (id) initWithItemName: (NSString *) name
                    valueInDollars: (int) value
                    serialNumber: (NSString *) sNumber;

//- (void) setContainedItem:(BNRItem *) i;
//- (BNRItem *) containedItem;

//- (void) setContainer:(BNRItem *) i;
//- (BNRItem *) container;

//- (void) setItemName: (NSString *) str;
//- (NSString *) itemName;

//- (void) setSerialNumber: (NSString *) str;
//- (NSString *) serialNumber;

//- (void) setValueInDollars: (int) i;
//- (int) valueInDollars;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;


//- (NSDate *) dateCreated;


@end
