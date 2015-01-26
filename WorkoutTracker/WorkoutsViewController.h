//
//  WorkoutsViewController.h
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
    //added datasource and delegate

@property (nonatomic) IBOutlet UITableView *tableView;
    //IBOutlet: sync the code with UI

//Making a change for git push

@end