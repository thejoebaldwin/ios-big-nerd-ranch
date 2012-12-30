//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Joseph Baldwin on 12/29/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "HypnosisViewController.h"

#import "HypnosisView.h"

@implementation HypnosisViewController




- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
    
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        //Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        // Give it a label
        [tbi setTitle:@"Hypnosis"];
        
        // Crea a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that image on the tab bar item
        [tbi setImage:i];
    }
    return self;
}

- (void) loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    [self setView:v];
}

@end
