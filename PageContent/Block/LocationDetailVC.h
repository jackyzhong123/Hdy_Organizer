//
//  LocationDetailVC.h
//  Organizer
//
//  Created by Sky on 15/8/19.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "NavigationPageVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationDetailVC : NavigationPageVC<MKMapViewDelegate>

@property (strong ,nonatomic) NSString *LocationId;
@property (nonatomic,strong) NSMutableArray* listData;
@property (strong, nonatomic) IBOutlet UITextField *txtLocationName;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)btnSave:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *txtLocationAddress;


@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;

@end
