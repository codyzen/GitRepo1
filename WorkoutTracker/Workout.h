//
//  Workout.h
//  WorkoutTracker
//
//  Created by Cody McDonald on 1/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject

//date and name properties of a Workout object
@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *category;

//Workout constructor declaration
- (instancetype)initWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year name:(NSString *)name location:(NSString *)location category:(NSString *)category;

@end
