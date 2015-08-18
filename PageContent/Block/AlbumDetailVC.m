//
//  AlbumDetailVC.m
//  Organizer
//
//  Created by Sky on 15/8/18.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "AlbumDetailVC.h"
#import "UIImageView+WebCache.h"

@interface AlbumDetailVC ()

@end

@implementation AlbumDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDictionary *data=[NSDictionary new];
    for (NSDictionary *obj in self.listData) {
        if ([[obj objectForKey:@"AlbumId"] isEqualToString:self.AlbumId]) {
            data=obj;
        }
          
    }
    
    self.txtAlbumName.text=[data objectForKey:@"AlbumName"];
    
    
      [self.imageView sd_setImageWithURL:[NSURL URLWithString:[data objectForKey:@"AlbumIcon"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
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
    //[self.http httpPostApi:@"" withBody:<#(NSDictionary *)#> withTag:<#(NSInteger)#>]
    
    
}
@end
