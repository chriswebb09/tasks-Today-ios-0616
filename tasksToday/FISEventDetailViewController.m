//
//  FISEventDetailViewController.m
//  tasksToday
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISEventDetailViewController.h"

@interface FISEventDetailViewController ()


@end

@implementation FISEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *stringItem = @" ";
    for (NSString *item in self.eventTitleArray) {
        stringItem = [stringItem stringByAppendingString:item];
        stringItem = [stringItem stringByAppendingString:@"\n"];
        
    }
    self.textView.text = stringItem;

    // Do view setup here.
}


@end
