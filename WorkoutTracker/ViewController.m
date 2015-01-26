//
//  ViewController.m
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "WorkoutsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    //bypassing story board functionality...
    
    //create WorkoutsViewController
    WorkoutsViewController *workoutsCtlr = [[WorkoutsViewController alloc] init];
    //create UINavigationController with WorkoutsViewController
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:workoutsCtlr];
    [self presentViewController:navCtrl animated:false completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
