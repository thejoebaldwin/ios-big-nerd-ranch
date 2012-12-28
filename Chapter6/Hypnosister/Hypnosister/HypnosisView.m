//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisView

- (void) drawRect: (CGRect) dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // figure out the center of the bounds rectanle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    //the thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    // The color of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    //The color of the line should be gray (red/green/blue = 0.6, alpha = 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    
    //Add a shape to the contect - this does not draw the hape
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    
    //Perform a drawing instruction; draw current shape with current state
    CGContextStrokePath(ctx);
}

@end
