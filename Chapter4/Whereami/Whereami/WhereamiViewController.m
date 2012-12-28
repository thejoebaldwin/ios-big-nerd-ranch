//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        [self doSomethingWeird];
        
        // There will be a warning from this line of code; ignore it for now
        [locationManager setDelegate:self];
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void) locationManager: (CLLocationManager *) manager
            didUpdateToLocation:(CLLocation *) newLocation
            fromLocation:(CLLocation *) oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void) locationManager: (CLLocationManager *) manager
            didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void) dealloc
{
    // Tell the location manager to stop sending us messages
    [locationManager setDelegate:nil];
}

- (void) doSomethingWeird
{
    NSLog(@"Line 1");
    NSLog(@"Line 2");
    NSLog(@"Line 3");
}












































@end
