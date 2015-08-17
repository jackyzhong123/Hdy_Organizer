//
//  Utilities.m
//  Jacky
//
//  Created by Sky on 15/6/16.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities


+(NSString *)urlDecode:(NSString*)str
{
  
    
    str = [str stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
    str = [str stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    str = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
      return str;
    
    
   }


+(NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    return uuidString;
}

+(NSString *)getServerHost
{
    return  @"jackyzhong.chinacloudsites.cn";
}

+(NSMutableArray *) getFunctionBlockForOrg
{
//    NSMutableDictionary *dic= [[NSMutableDictionary alloc] init];
//    [dic setValue:@"添加活动" forKey:@"title"];
//    [dic setValue:@"活动一览" forKey:@"title"];
    NSMutableArray *array=[[NSMutableArray alloc] init];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"添加活动",@"title",@"0",@"XibName", nil];
    
    [array addObject:dic];
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"添加专辑",@"title",@"AddNewAlbum",@"XibName", nil];
    [array addObject:dic];
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"添加地点",@"title",@"1",@"XibName", nil];
    [array addObject:dic];
    
    
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"活动一览",@"title",@"AlbumList",@"XibName", nil];
    [array addObject:dic];
    
   
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"专辑一览",@"title",@"AlbumList",@"XibName", nil];
    [array addObject:dic];
    
    
   
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"地点一览",@"title",@"1",@"XibName", nil];
    [array addObject:dic];
    
    
    dic=[NSDictionary dictionaryWithObjectsAndKeys:@"人员管理",@"title",@"1",@"XibName", nil];
    [array addObject:dic];
    
   // dic=[NSDictionary dictionaryWithObjectsAndKeys:@"地点一览",@"title",@"1",@"function", nil];
    //[array addObject:dic];
    
    return  array;
    
}




+(void) saveLocalStr:(NSString *)str withKey:(NSString *)key
{
    // NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:str forKey:key];
    
    
    [defaults synchronize];
    
    
    
}



@end
