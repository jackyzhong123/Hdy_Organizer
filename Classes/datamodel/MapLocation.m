//
//  MapLocation.m
//  Organizer
//
//  Created by Sky on 15/8/19.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "MapLocation.h"

@implementation MapLocation

- (NSString *)title {
    return @"活动场地!";
}
- (NSString *)subtitle {
    
    NSMutableString *ret = [NSMutableString new];
    if (_state)
        [ret appendString:_state];
    if (_city)
        [ret appendString:_city];
    if (_city && _state)
        [ret appendString:@", "];
    if (_streetAddress && (_city || _state || _zip))
        [ret appendString:@" • "];
    if (_streetAddress)
        [ret appendString:_streetAddress];
    if (_zip)
        [ret appendFormat:@", %@", _zip];
    
    return ret;
}


@end