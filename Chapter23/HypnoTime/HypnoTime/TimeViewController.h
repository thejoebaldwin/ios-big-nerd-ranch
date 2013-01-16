//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Joseph Baldwin on 12/29/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
    
}
- (IBAction) showCurrentTime:(id) sender;
- (void) spinTimeLabel;
@end
