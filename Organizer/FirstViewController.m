//
//  FirstViewController.m
//  Organizer
//
//  Created by Sky on 15/7/29.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "FirstViewController.h"
#import "CVCFunction.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 //  WebRequestHelper *http=[[WebRequestHelper alloc] init];
    
   //  [self.http httpGetApi:@"api/HuoDongService/GetMyConfig" withBody:nil withTag:1];
    self.cvFunctions.delegate=self;
    self.cvFunctions.dataSource=self;
    
  //  [self.cvFunctions registerClass:CVCFunction  forCellWithReuseIdentifier:@"Cell"];
    
    
    
    
    
   // [self.functionsBlock addObject:<#(id)#>]
    
    
}

#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    
    switch (tag) {
        case 1:
            self.lblOrgNickName=[arr objectForKey:@"NickName"];
            
            
            break;
            
        default:
            break;
    }


}

- (void)requestDataFailed:(NSString *)error
{
    
}
//图片下载完成
-(void)downloadImageComplete:(NSInteger)imageid
{
    
}



#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return 9;
    return  [[Utilities getFunctionBlockForOrg] count];
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"Cell";
    CVCFunction * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    NSDictionary *event = [[Utilities getFunctionBlockForOrg] objectAtIndex:(indexPath.section*3 + indexPath.row)];
    
    
    //cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    cell.backgroundColor=[UIColor whiteColor];
    
    cell.XibName=[event objectForKey:@"XibName"];
    
    
    cell.label.text=[event objectForKey:@"title"];
   
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    return CGSizeMake(rx.size.width/3-1, rx.size.width/3-1);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVCFunction * cell = (CVCFunction *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
   // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   // UIViewController *vc=[storyboard instantiateViewControllerWithIdentifier:cell.XibName];
     [self performSegueWithIdentifier:cell.XibName sender:self];
    
   // [self presentViewController:vc animated:YES completion:nil];
    
    
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
