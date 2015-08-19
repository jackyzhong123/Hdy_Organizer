//
//  AddNewPlaceVC.h
//  Organizer
//
//  Created by Sky on 15/8/19.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "NavigationPageVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@interface AddNewPlaceVC : NavigationPageVC<MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locMgr;

@property (strong, nonatomic) IBOutlet UITextField *txtPlaceName;
@property (strong, nonatomic) IBOutlet UITextView *LocationAddress;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)buttonActionTouched:(id)sender;
 
@property (strong,nonatomic) CLLocationManager *locationManager;





@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;

- (IBAction)btnSave:(id)sender;


@end
