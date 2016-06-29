//
//  FISViewController.m
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <EventKit/EventKit.h>

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requestCalendarPermission];
    [self getLastYearsEvents];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSMutableArray *titleArray = [[NSMutableArray alloc]init];
    NSUInteger index = 0;
    NSString *eventTitle = @"";
    if ([segue.identifier isEqualToString:@"lastYear"]) {
        
        self.passedEventDetails = [self getLastYearsEvents];
        for (NSUInteger i = 0; i <  self.passedEventDetails.count; i++) {
            EKEvent *newEvent = self.passedEventDetails[i];
            [titleArray addObject:newEvent.title];
        }
//        for (EKEvent *item in [self getLastYearsEvents]) {
//            index += 1;
//            eventTitle = [NSString stringWithFormat:@"%@", item.title];
//            
//        }
        NSLog(@"\n\n\n\n\n NEW_TITILE %@", eventTitle);
        NSLog(@"%@", self.passedEventDetails);
        
    } else if ([segue.identifier isEqualToString:@"nextYear"]) {
        self.passedEventDetails = [self getNextYearsEvents];
        for (NSUInteger i = 0; i <  self.passedEventDetails.count; i++) {
            EKEvent *newEvent = self.passedEventDetails[i];
            [titleArray addObject:newEvent.title];
        }
        //NSLog(@"PASSED EVENT: %@", self.passedEventDetails[0][@"EKEvent"]);
    }
    
    FISEventDetailViewController *eventDetailVC = [segue destinationViewController];
    eventDetailVC.passedThroughEventDetails = self.passedEventDetails;
    eventDetailVC.eventTitleArray = titleArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSArray *)getNextYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = 1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:[NSDate date]
                                                            endDate:oneYearFromNow
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    return events;
}

- (NSArray *)getLastYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create the start date components
    
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = -1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:oneYearFromNow
                                                            endDate:[NSDate date]
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    return events;
}

-(void)requestCalendarPermission
{
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
    }];
}

@end
