//
//  AddNewAlbumVC.m
//  Organizer
//
//  Created by Sky on 15/8/17.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "AddNewAlbumVC.h"
#import "UIImageView+WebCache.h"

@interface AddNewAlbumVC ()

@end

@implementation AddNewAlbumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
}




- (IBAction)buttonActionTouched:(id)sender {
    
     NSInteger tag = [sender tag];
    
    if (tag==1) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if(tag==2)
    {
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        if ([self.imageCover.sd_imageURL absoluteString]==nil) {
            [dic setValue:@"http://hdy.awblob.com/portrait/default" forKey:@"ImageUrl"];
        }else
        {
            [dic setValue:[self.imageCover.sd_imageURL absoluteString] forKey:@"ImageUrl"];

        }
        [dic setValue:self.txtName.text forKey:@"AlbumName"];
        
         [self.http httpPostApi:@"api/HuoDongService/AddNewAlbum" withBody:dic withTag:3];
    }
    
    
    //NSDictionary *data=[NSDictionary dictionaryWithObject:@"dd" forKey:@"name"];
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
//    [dic setValue:self.txtUserName.text  forKey:@"NickName"];
//    [dic setValue:self.txtPassword.text forKey:@"Password"];
//    
//    
//    [self.http httpPostApi:@"api/Login/OrgLogin" withBody:dic withTag:1];
    
    
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    UIImage *editedimage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSData *dataObj = UIImageJPEGRepresentation(editedimage, 1.0);
  //  UIImageWriteToSavedPhotosAlbum(editedimage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    
    
     //[self uploadImg:[self saveImage:theImage WithName:@"salesImageSmall.jpg"]];
    
    [self.http uploadImage:@"api/HdyUploadImageHead" withImage:dataObj withBody:nil withTag:1];
    
    
    
   // UIImage  *theImage = [XLdetailViewController imageWithImageSimple:editedimage scaledToSize:CGSizeMake(150.0, 150.0)];
    
  //  [self uploadImg:[self saveImage:theImage WithName:@"salesImageSmall.jpg"]];
    
    
    
    
    
    
    
    
    
    
    // [self performSelector:@selector(SaveImage:) withObject:image afterDelay:0.0];
    
}


#pragma mark 网络请求回调

- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag {
    NSDictionary *arr = response;
    // NSLog(@"%@",[arr objectForKey:@"IsValid"]);
    // NSLog(@"%@",[arr objectForKey:@"Url"]);
    
    
    switch (tag) {
        case 1:
 
            
            
            [self.imageCover sd_setImageWithURL:[NSURL URLWithString:[arr objectForKey:@"Url"]]
                              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            
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

@end
