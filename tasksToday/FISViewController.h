//
//  FISViewController.h
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISEventDetailViewController.h"

@interface FISViewController : UIViewController
@property (strong, nonatomic) NSArray *passedEventDetails;

- (NSArray *)getNextYearsEvents;
- (NSArray *)getLastYearsEvents;
- (void)requestCalendarPermission;

@end
