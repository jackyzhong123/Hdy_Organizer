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
     NSInteger tag = [sender tag];
    if (tag==1) {
       // [self.http uploadImage:@"api/HdyUploadImageByUser" withImage:nil withBody:nil withTag:nil];
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }else if(tag==2)
    {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        [dic setObject:self.txtAlbumName.text forKey:@"AlbumName"];
        [dic setObject:self.AlbumId forKey:@"AlbumId"];
        
        [self.http httpPostApi:@"api/HuoDongService/saveAlbumById" withBody:dic withTag:2];
    }
    
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *editedimage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSData *dataObj = UIImageJPEGRepresentation(editedimage, 1.0);
    //  UIImageWriteToSavedPhotosAlbum(editedimage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    
    
    //[self uploadImg:[self saveImage:theImage WithName:@"salesImageSmall.jpg"]];
    
   // NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil]
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:@"album" forKey:@"type"];
    [dic setObject:self.AlbumId forKey:@"itemid"];
    
    
    
    [self.http uploadImage:@"api/HdyUploadImageByUser" withImage:dataObj withBody:dic withTag:1];
    
    
    
    
}




#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    
    
    switch (tag) {
        case 1:
            
        
          //  [self.collectionView reloadData];
            
             [self.imageView sd_setImageWithURL:[NSURL URLWithString:[arr
                                                                      objectForKey:@"Url"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            break;
        case 2:
            //[self.imageView sd_setImageWithURL:[NSURL URLWithString:[arr objectForKey:@"Url"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            

            
            
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





@end
