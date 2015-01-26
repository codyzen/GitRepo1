//
//  WorkoutDetailsViewController.h
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//
//  Controller for Workout Details view

#import <UIKit/UIKit.h>
#import "Workout.h"

@interface WorkoutDetailsViewController : UIViewController
- (IBAction)wktSaveBtn:(id)sender;
- (IBAction)wktDeleteBtn:(id)sender;


//properties for Workout details view
@property (nonatomic) Workout *workout;
//@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wktNameLbl;
@property (weak, nonatomic) IBOutlet UITextField *wktNameTxt;
@property (weak, nonatomic) IBOutlet UILabel *wktLocationLbl;
@property (weak, nonatomic) IBOutlet UITextField *wktLocationTxt;
@property (weak, nonatomic) IBOutlet UILabel *wktCategoryLbl;
@property (weak, nonatomic) IBOutlet UITextField *wktCategoryTxt;



@end
