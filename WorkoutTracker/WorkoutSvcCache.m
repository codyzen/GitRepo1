//
//  WorkoutSvcCache.m
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/25/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "WorkoutSvcCache.h"

@implementation WorkoutSvcCache

NSMutableArray *workouts = nil;

- (id) init{
    if (self = [super init]) {
        workouts = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Workout *) createWorkout: (Workout *) workout {
    NSLog(@"WorkoutSvcCache::createWorkout -- Entering...");
    
    //TODO need to enforce unique constraint on workouts.name
    //i.e. iterate through array, if already exists return nill, handle nil from controller
    
    NSLog([NSString stringWithFormat:@"workouts count before = %lu", workouts.count]);
    
    [workouts addObject: workout];
    
    NSLog([NSString stringWithFormat:@"workouts count after = %lu", workouts.count]);
    
    NSLog(@"WorkoutSvcCache::createWorkout -- Exiting...");
    return workout;
}

- (NSMutableArray *) retrieveAllWorkouts {
    return workouts;
}

- (Workout *) updateWorkout: (Workout *) workout { return workout;
    
    //Note: until we implement a DB, treating workout.name as the unique ientifier
    
    //iterate through array to find index where workout name exists
    int i;
    for (i = 0; i < [workouts count]; i++) {
        Workout *arrayElement = [workouts objectAtIndex:i];
        if(workout.name == arrayElement.name){
            //i is the index we want to replace at
            break;
        }
    }
    if(i < [workouts count]){   //there was a match
        //replace objet at index#
        [workouts replaceObjectAtIndex:i withObject:workout];
    } else {
        return nil;
        //when using update method, if result == 0 call createWorkout
    }
    
}

- (Workout *) deleteWorkout: (Workout *) workout {
    
    //Note: until we implement a DB, treating workout.name as the unique ientifier
    
    //iterate through array to find index where workout name exists
    int i;
    for (i = 0; i < [workouts count]; i++) {
        Workout *arrayElement = [workouts objectAtIndex:i];
        if(workout.name == arrayElement.name){
            //i is the index we want to remove
            break;
        }
    }
    [workouts removeObjectAtIndex:i];
    
    return workout;

}

@end
