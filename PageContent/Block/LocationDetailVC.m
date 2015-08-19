//
//  LocationDetailVC.m
//  Organizer
//
//  Created by Sky on 15/8/19.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "LocationDetailVC.h"
#import <MapKit/MapKit.h>
#import "MapLocation.h"
@interface LocationDetailVC ()

@end

@implementation LocationDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapView.mapType=MKMapTypeStandard;
    _mapView.delegate=self;
    
    
    UITapGestureRecognizer *mTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPress:)];
    [self.mapView addGestureRecognizer:mTap];
    
    NSDictionary *data=[NSDictionary new];
    for (NSDictionary *obj in self.listData) {
        if ([[obj objectForKey:@"id"] isEqualToString:self.LocationId]) {
            data=obj;
        }
        
    }
    
    self.txtLocationName.text=[data objectForKey:@"LocationName"];
    self.txtLocationAddress.text=[data objectForKey:@"LocationAddress"];

    
    MapLocation *annotation=[[MapLocation alloc] init];
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake([[data objectForKey:@"Latitude"] doubleValue],[[data objectForKey:@"Longitude"] doubleValue]);
    
 
    annotation.coordinate=coords;
    
    [_mapView addAnnotation:annotation];
    
    
    
    MKCoordinateRegion viewRegion=MKCoordinateRegionMakeWithDistance(coords, 10000, 10000);
    
    [_mapView setRegion:viewRegion animated:YES];

}



-(void)tapPress:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint touchPoint=[gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate=[self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    // CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [_mapView removeAnnotations:_mapView.annotations];
    
    
    
    
    
    MapLocation *annotation=[[MapLocation alloc] init];
    
    annotation.coordinate=touchMapCoordinate;
    
    //self.selectedCoordinate=&(touchMapCoordinate);
    
    self.latitude=touchMapCoordinate.latitude;
    self.longitude=touchMapCoordinate.longitude;
    
    
    [_mapView addAnnotation:annotation];
    
    
    
    
    
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

- (IBAction)btnSave:(id)sender {
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setValue:self.txtLocationAddress.text forKey:@"AddressName"];
    [dic setValue:self.txtLocationName.text forKey:@"LocationName"];
    MapLocation *obj= [_mapView.annotations objectAtIndex:0];
    
    
    [dic setValue:[NSNumber numberWithDouble:obj.coordinate.latitude] forKey:@"latitude"];
    [dic setValue:[NSNumber numberWithDouble:obj.coordinate.longitude] forKey:@"longtitude"];
    [dic setValue:self.LocationId forKey:@"LocationId"];
    
    [self.http httpPostApi:@"api/HuoDongService/ModifyLocation" withBody:dic withTag:1];
    
    
}
- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    NSLog(@"保存成功");

}





@end
