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

- (void) loadView
{
    // Create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    [self setView:v];
}

@end
