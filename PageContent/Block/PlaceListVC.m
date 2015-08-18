//
//  AlbumListVC.m
//  Organizer
//
//  Created by Sky on 15/8/17.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "PlaceListVC.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface PlaceListVC ()

@end

@implementation PlaceListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.listData=[[NSMutableArray alloc] init];
    [self.http httpPostApi:@"api/HuoDongService/getPlaceList" withBody:nil withTag:1];
    
    
}

#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    
    
    switch (tag) {
        case 1:
            
            self.listData=[arr objectForKey:@"data"];
            [self.tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSInteger row = indexPath.row;
    NSDictionary *dict = [self.listData objectAtIndex:row];
    cell.imageView.image= [UIImage imageNamed:[dict objectForKey:@"AlbumIcon"]];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"AlbumIcon"]]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    cell.textLabel.text=[dict objectForKey:@"AlbumName"];
    
    
    return cell;
}


@end
