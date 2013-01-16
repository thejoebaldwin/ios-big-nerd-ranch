//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Joseph Baldwin on 12/28/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [boxLayer setPosition:p];
    [CATransaction commit];
    
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    [boxLayer setPosition:p];
    
}

- (void) setCircleColor:(UIColor *) clr
{
    circleColor = clr;
    [self setNeedsDisplay];
    
}


- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void) drawRect: (CGRect) dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    //the thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    
    [[self circleColor] setStroke];
    
    // Draw concetric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Add a path to the context
        CGContextAddArc(ctx, center.x, center.y,
                        currentRadius, 0.0, M_PI * 2.0, YES);
        // Performs drawing instruction; removes path
        CGContextStrokePath(ctx);
    }
    
    
    // Create a string
    NSString *text = @"You are getting sleepy.";
    
    //Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    // How big is this string when drawn in this font?
    textRect.size = [text sizeWithFont:font];
    
    //Let's put that string in the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    //Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    
    // The shadow will move 4 points to the right and 3 points down from the text
    CGSize offset = CGSizeMake(4, 3);
    
    // The shadow will be dark gray in color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // Set the shadow of the context with these parameters
    // all subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    //Draw the string
    [text drawInRect:textRect withFont:font];
}

- (id) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        // All HypnosisViews start with a clear backgorund color
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
        
        //Create the new layer object
        boxLayer = [[CALayer alloc] init];
        [boxLayer setBounds:CGRectMake(0.0, 0.0, 85.0, 85.0)];
        
        // Give it a location
        [boxLayer setPosition:CGPointMake(160.0, 100.0)];
        
        //Make half-transparent red the background color for the layer
        UIColor *reddish = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
        
        //Get a CGColor object with the same color values
        CGColorRef cgReddish = [reddish CGColor];
        [boxLayer setBackgroundColor:cgReddish];
        
        
        
        //Give it a size
        
        
        //Create a UIImage
        UIImage *layerImage = [UIImage imageNamed:@"Hypno.png"];
        
        // Get the underlying CGImage
        CGImageRef image = [layerImage CGImage];
        
        // Put the CGImage on the layer
        [boxLayer setContents: (__bridge id) image];
        
        // Inset the image a bit on each side
        [boxLayer setContentsRect:CGRectMake(-0.1, -0.1, 1.2, 1.2)];
        
        //let the image rezise (without changing the aspect ratio)
        // to fill the contentRect
        [boxLayer setContentsGravity:kCAGravityResizeAspect];

        
        
        //Make it a sublayer of the view's layer
        [[self layer] addSublayer:boxLayer];
                
        
        
    }
    return self;
}


@end
