//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController


- (void) findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void) foundLocation: (CLLocation *) loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate: coord title:[locationTitleField text]];
    
    //Add it to the map view
    [worldView addAnnotation:mp];
    
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [self findLocation];
    
    [textField resignFirstResponder];
    return YES;
}

- (void) mapView:(MKMapView *) mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Here we are... but how do we actually zoom?
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion: region animated:YES];
    
}

- (void) viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        //[self doSomethingWeird];
        
        // There will be a warning from this line of code; ignore it for now
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        //[locationManager startUpdatingLocation];
    }
    return self;
}

- (void) locationManager: (CLLocationManager *) manager
            didUpdateToLocation:(CLLocation *) newLocation
            fromLocation:(CLLocation *) oldLocation
{
    NSLog(@"%@", newLocation);
    
    // How many seconds ago was this new location created?
    NSTimeInterval  t = [[newLocation timestamp] timeIntervalSinceNow];
    
    //CLLocationMangers will return the last found location of the
    // device first, you don't want that data in this case
    // If this location was made more than 3 minutes ago, ingore it
    if (t < -180) {
        //this is cached data, you don't want it, keep looking
        return;
    }
    
[self foundLocation:newLocation];
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
