//
//  WorkoutsViewController.m
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "WorkoutsViewController.h"
#import "Workout.h"
#import "WorkoutSvcCache.h"
#import "WorkoutDetailsViewController.h"

@interface WorkoutsViewController ()

//refactored to use WorkoutSvc instead of this array
//adding workouts array as a property
//@property (nonatomic) NSMutableArray *workouts;

@end

@implementation WorkoutsViewController

//reference service
WorkoutSvcCache *workoutSvc2 = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"WktsVwCtrl::viewDidLoad -- Entering...");
    // Do any additional setup after loading the view from its nib.
    //self.view.backgroundColor = [UIColor redColor];
    
    //initialize service
    workoutSvc2 = [[WorkoutSvcCache alloc] init];
    
    //setting up dataSource and delegate
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Create stubbed data
    //initialize workouts property  //!!!!!
    //self.workouts = [[NSMutableArray alloc] init]; //!!!!!
    /*
    for (int i = 0; i < 50; i++) {
        NSString *name = [NSString stringWithFormat:@"Workout #%d", i];
        NSString *location = @"CorePower Yoga";
        NSString *category = @"Yoga/Pilates";
        Workout *workout = [[Workout alloc] initWithDay:1 month:1 year:2015 name:name location:location category:category];
        [self.workouts addObject:workout];
    }
     */
    
    
    //initialize first workout
    NSLog(@"Creating first workout...");
    Workout *workout = [[Workout alloc] init];
    workout.name = @"Hot Fusion Yoga";
    workout.location = @"CorePower Yoga";
    workout.category = @"Yoga/Pilates";
    Workout *firstWkt = [workoutSvc2 createWorkout:workout];
    NSLog([NSString stringWithFormat:@"First Workout: #%@", firstWkt.name]);
    NSLog(@"First Workout created!!!");
    NSLog([NSString stringWithFormat:@"retriveAllWorkouts: %lu", (unsigned long)[[workoutSvc2 retrieveAllWorkouts] count]]);
    
    NSLog(@"WktsVwCtrl::viewDidLoad -- Exiting...");

}

- (void)didReceiveMemoryWarning {
    NSLog(@"WktsVwCtrl::didReceiveMemoryWarning -- Entering...");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"WktsVwCtrl::didReceiveMemoryWarning -- Exiting...");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"WktsVwCtrl::viewWillAppear -- Entering...");
    NSLog(@"Setting title to Workouts");
    self.navigationItem.title = @"Workouts";
    NSLog(@"WktsVwCtrl::viewWillAppear -- Exiting...");
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"WktsVwCtrl::numberOfRowsInSection -- Entering...");
    
    NSLog([NSString stringWithFormat:@"retrieveAllWorkouts count = %lu", (unsigned long)[[workoutSvc2 retrieveAllWorkouts] count]]);
    //return self.workouts.count;
    
    NSLog(@"WktsVwCtrl::numberOfRowsInSection -- Exiting...");
    return [[workoutSvc2 retrieveAllWorkouts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"WktsVwCtrl::cellForRowAtIndexPath -- Entering...");
    
    NSString *cellId = @"workoutCellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    Workout *workout = [[workoutSvc2 retrieveAllWorkouts]objectAtIndex:indexPath.row];
    cell.textLabel.text = workout.name;
    
    
    //NSInteger row = indexPath.row;
    //Workout *workout = [self.workouts objectAtIndex:row];

    NSLog(@"WktsVwCtrl::cellForRowAtIndexPath -- Exiting...");
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"WktsVwCtrl::didSelectRowAtIndexPath -- Entering...");
    
    //display WorkoutDetailView with details of the selected workout
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    //Workout *workout = [self.workouts objectAtIndex:indexPath.row];
    
    Workout *workout = [[workoutSvc2 retrieveAllWorkouts]objectAtIndex:indexPath.row];
    
    WorkoutDetailsViewController *workoutDetailsCtrl = [[WorkoutDetailsViewController alloc] init];
    workoutDetailsCtrl.workout = workout;
    [self.navigationController pushViewController:workoutDetailsCtrl animated:true];
    
    NSLog(@"WktsVwCtrl::didSelectRowAtIndexPath -- Exiting...");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
