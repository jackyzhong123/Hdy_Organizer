//
//  AlbumListVC.m
//  Organizer
//
//  Created by Sky on 15/8/17.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "AlbumListVC.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface AlbumListVC ()

@end

@implementation AlbumListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.listData=[[NSMutableArray alloc] init];
    [self.http httpPostApi:@"api/HuoDongService/getAlbumList" withBody:nil withTag:1];
    
    
}

#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    // NSLog(@"%@",[arr objectForKey:@"Url"]);
    
    
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
  //  cell.accessoryType=UITableViewCellAccessoryDetailButton;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
