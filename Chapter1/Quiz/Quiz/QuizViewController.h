//
//  QuizViewController.h
//  Quiz
//
//  Created by Joseph Baldwin on 12/26/12.
//  Copyright (c) 2012 Joe Baldwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{

int currentQuestionIndex;

// The model objects
NSMutableArray *questions;
NSMutableArray *answers;

// The view objects
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;


@end
