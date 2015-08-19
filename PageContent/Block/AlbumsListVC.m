//
//  AlbumListVC.m
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "AlbumsListVC.h"
#import "CVCAlbum.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "AlbumDetailVC.h"

@interface AlbumListsVC ()

@end

@implementation AlbumListsVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   //[self.collectionView registerClass:[CVCAlbum class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    
    
    self.listData=[[NSMutableArray alloc] init];
    [self.http httpPostApi:@"api/HuoDongService/getAlbumList" withBody:nil withTag:1];
    
    
    
    // Do any additional setup after loading the view.
}


#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    
    
    switch (tag) {
        case 1:
            
            self.listData=[arr objectForKey:@"data"];
            [self.collectionView reloadData];
            
            
            
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

#pragma mark <UICollectionViewDataSource>

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    return CGSizeMake(rx.size.width/3-10, rx.size.width/3 +10);
}


//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.listData count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CVCAlbum *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    
    
    
    NSDictionary *event = [self.listData  objectAtIndex:(indexPath.row)];
    
    
    

    
    cell.lblAlbumName.text =[NSString stringWithFormat:@"%@" , [event objectForKey:@"AlbumName"]];
    
 
    
     [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[event objectForKey:@"AlbumIcon"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    return cell;
    
   
    
    
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *event = [self.listData objectAtIndex:(indexPath.row)];
    [self performSegueWithIdentifier:@"AlbumDetail" sender:self];
    
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AlbumDetail"]) {
        //
        AlbumDetailVC *vc=segue.destinationViewController;
        NSIndexPath *indexPath=[[self.collectionView indexPathsForSelectedItems] firstObject];
        
        NSDictionary *obj=[self.listData objectAtIndex:indexPath.row];
        vc.AlbumId=[obj objectForKey:@"AlbumId"];
        vc.listData=self.listData;
        
        
        
    }
}



#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
