//
//  DetailViewController.h
//  Homepwner
//
//  Created by Joseph Baldwin on 1/8/13.
//  Copyright (c) 2013 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController
{
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *nameField;
}
@property (nonatomic, strong) BNRItem *item;
@end
