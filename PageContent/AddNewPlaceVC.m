//
//  AddNewPlaceVC.m
//  Organizer
//
//  Created by Sky on 15/8/19.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "AddNewPlaceVC.h"
#import <MapKit/MapKit.h>
#import "MapLocation.h"

@interface AddNewPlaceVC ()

@end

@implementation AddNewPlaceVC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView.mapType=MKMapTypeStandard;
    _mapView.delegate=self;
    _mapView.showsUserLocation=YES;
    
    
    _locationManager=[[CLLocationManager alloc] init];

    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization]; // 永久授权
        [self.locationManager requestWhenInUseAuthorization]; //使用中授权
    }
    
    
     _locationManager.delegate=self;
    _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    _locationManager.distanceFilter=100.0f;
    ;
    
 
    UITapGestureRecognizer *mTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPress:)];
    [self.mapView addGestureRecognizer:mTap];
    
    
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
    
    //[_mapView addAnnotation:<#(id<MKAnnotation>)#>]
    
    
    
}







-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_locationManager startUpdatingLocation];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
}

/**
 *  只要定位到用户的位置，就会调用（调用频率特别高）
 *  @param locations : 装着CLLocation对象
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //CLLocation中存放的是一些经纬度, 速度等信息. 要获取地理位置需要转换做地理位置编码.
    // 1.取出位置对象
    CLLocation *loc = [locations firstObject];
    
//    NSLog(@"CLLocation----%@",loc);
    
    // 2.取出经纬度
    CLLocationCoordinate2D coordinate = loc.coordinate;
    
    // 3.打印经纬度
   // NSLog(@"didUpdateLocations------%f %f", coordinate.latitude, coordinate.longitude);
    
    // 停止定位(省电措施：只要不想用定位服务，就马上停止定位服务)
    [manager stopUpdatingLocation];
    
    MKCoordinateRegion viewRegion=MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000);
    
    [_mapView setRegion:viewRegion animated:YES];
}

 

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonActionTouched:(id)sender
{
    [_txtPlaceName resignFirstResponder];
    [_LocationAddress resignFirstResponder];
    NSInteger tag=[sender tag];
    if (tag==1) {
        //开始定位
        if(_LocationAddress.text==nil||[_LocationAddress.text length]==0)
        {
            return;
        }
        CLGeocoder *geocoder=[[CLGeocoder alloc]init];
        [geocoder geocodeAddressString:_LocationAddress.text completionHandler:^(NSArray *placemarks, NSError *error) {
            
            if ([placemarks count]>0) {
                [_mapView removeAnnotations:_mapView.annotations];
            }
            for (int i=0;i<[placemarks count]; i++) {
                CLPlacemark *placemake=placemarks[i];
                MKCoordinateRegion viewRegion=MKCoordinateRegionMakeWithDistance(placemake.location.coordinate, 10000, 10000);
                
                [_mapView setRegion:viewRegion animated:YES];
                
                
                MapLocation *annotation=[[MapLocation alloc] init];
                annotation.streetAddress=placemake.thoroughfare;
                annotation.city=placemake.locality;
                annotation.state=placemake.administrativeArea;
                annotation.zip=placemake.postalCode;
                annotation.coordinate=placemake.location.coordinate;
                
                [_mapView addAnnotation:annotation];
                
                
                
                if ([placemarks count]==1) {
                    self.latitude=placemake.location.coordinate.latitude;
                    self.longitude=placemake.location.coordinate.longitude;
                }
            }
           
            
        }];

    }else if(tag==2)
    {
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        [dic setValue:self.LocationAddress.text forKey:@"AddressName"];
        [dic setValue:self.txtPlaceName.text forKey:@"LocationName"];
        [dic setValue:[NSNumber numberWithDouble:self.latitude] forKey:@"latitude"];
        [dic setValue:[NSNumber numberWithDouble:self.longitude] forKey:@"longtitude"];
        
        [self.http httpPostApi:@"api/HuoDongService/AddNewLocation" withBody:dic withTag:1];
    }
}


#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    // NSLog(@"%@",[arr objectForKey:@"Url"]);
    
    
    switch (tag) {
        case 1:
            
            
            
            //[self.imageCover sd_setImageWithURL:[NSURL URLWithString:[arr objectForKey:@"Url"]]
                           //    placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
             
            break;
        case 2:
            
            break;
        case 3:
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
            
            NSLog(@"保存成功");
            break;
        default:
            break;
    }
    
}

- (void)requestDataFailed:(NSString *)error
{
    
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
    [dic setValue:self.LocationAddress.text forKey:@"AddressName"];
    [dic setValue:self.txtPlaceName.text forKey:@"LocationName"];
    [dic setValue:[NSNumber numberWithDouble:self.latitude] forKey:@"latitude"];
    [dic setValue:[NSNumber numberWithDouble:self.longitude] forKey:@"longtitude"];
    
    [self.http httpPostApi:@"api/HuoDongService/AddNewLocation" withBody:dic withTag:1];
}
@end
