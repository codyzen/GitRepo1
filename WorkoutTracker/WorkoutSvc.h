//
//  WorkoutSvc.h
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"

@protocol WorkoutSvc <NSObject>

- (Workout *) createWorkout: (Workout *) workout;
- (NSMutableArray *) retrieveAllWorkouts;
- (Workout *) updateWorkout: (Workout *) workout;
- (Workout *) deleteWorkout: (Workout *) workout;

@end
