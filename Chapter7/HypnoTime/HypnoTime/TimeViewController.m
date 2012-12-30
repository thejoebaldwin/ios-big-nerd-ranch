//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Joseph Baldwin on 12/29/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController


- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"CurrentTiemViewController will Disappear");
    [super viewWillDisappear:animated];
    
}

// views are never purged in iOS 6 so this is never called
//- (void) viewDidUnload
//{
//    [super viewDidUnload];
    //NSLog(@"Unloading TimeViewController's subviews");
    //timeLabel = nil;
//    NSLog(@"timelabel = %@", timeLabel);
//}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor: [UIColor greenColor]];

    
    NSLog(@"TimeViewController loaded its view.");
    
}


- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the superclass's designated initializer
    //self = [super initWithNibName:nil bundle:nil];
    
    
    
    // Get a pointer to the application bundle object
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    
    if (self) {
        //Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Time"];
        
        // Crea a UIImage from a file
        // This will use Time@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Time"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
        
        
    }
    return self;
}

- (IBAction) showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
    
}

@end
