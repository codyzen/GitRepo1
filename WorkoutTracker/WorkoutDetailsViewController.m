//
//  WorkoutDetailsViewController.m
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/22/15.
//  Copyright (c) 2015 msse650. All rights reserved
//
//  Controller for Workout Details view

#import "WorkoutDetailsViewController.h"
#import "WorkoutSvc.h"
#import "WorkoutSvcCache.h"

@implementation WorkoutDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set label to Workout name
    self.wktNameLbl.text = @"Workout Name";
    //set text box to Workout name
    self.wktNameTxt.text = self.workout.name;
    
    //set label to Location
    self.wktLocationLbl.text = @"Location";
    //set text box to Location
    self.wktLocationTxt.text = self.workout.location;
    
    //set label to Category
    self.wktCategoryLbl.text = @"Category";
    //set text box to Category
    self.wktCategoryTxt.text = self.workout.category;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)wktSaveBtn:(id)sender {
    NSLog(@"WktDtlController::wktSaveBtn -- Entering...");
    //dismiss keyboard
    [self.view endEditing:YES];
    Workout *workoutNew = [[Workout alloc] init];
    workoutNew.name = self.wktNameTxt.text;
    workoutNew.location = self.wktLocationTxt.text;
    workoutNew.category = self.wktCategoryTxt.text;
    [[WorkoutSvcCache sharedInstance] createWorkout:workoutNew];
    NSLog(@"WktDtlController::wktSaveBtn -- Exiting...");
}

- (IBAction)wktDeleteBtn:(id)sender {
    NSLog(@"WktDtlController::wktDeleteBtn -- Entering...");
    //dismiss keyboard
    [self.view endEditing:YES];
    NSLog(@"WktDtlController::wktDeleteBtn -- Exiting...");
}
@end
