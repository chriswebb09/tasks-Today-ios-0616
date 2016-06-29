//
//  FISEventDetailViewController.h
//  tasksToday
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISViewController.h"

@interface FISEventDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) NSArray *passedThroughEventDetails;
@property (strong, nonatomic) NSString *eventTitle;
@property (strong, nonatomic) NSArray *eventTitleArray;

@end
