//
//  WebRequestHelper.m
//  AppScenicSpot
//
//  Created by GUZUQIANG on 12/27/13.
//  Copyright (c) 2013 edonesoft. All rights reserved.
//

#import "WebRequestHelper.h"


#import "AppConfiguration.h"



/**
 *网络请求方法
 *
 */
@implementation WebRequestHelper

 

@synthesize mydelegate;

 
/**
 *处理请求响应数据
 *
 */
- (void)handleHttpResponse:(id)responseObject withTag:(NSInteger)tag
{
    NSString *response = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
    
    NSData *jsonData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObject;
   
    @try {
        jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
        
        
        
        //为空或不包含code字段，则请求失败
        if (jsonObject == nil || [jsonObject objectForKey:@"Code"] == nil) {
            if (self.mydelegate != nil) {
                [self.mydelegate requestDataFailed:@"网络异常,无效的响应."];
            }
            return;
        }
        NSInteger errorCode = [[jsonObject objectForKey:@"Code"] intValue];
        //code为1000正常的响应
        if (errorCode == 10000) {
            if (self.mydelegate != nil) {
                [self.mydelegate requestDataComplete:[jsonObject objectForKey:@"Detail"] requestTag:tag];
            }
            return;
        }
        //Code为20000,token令牌失效
        if (errorCode == 20000) {
            if ([[AppConfiguration sharedInstance]isUserLogin]) {
                //登出，清空token
                [[AppConfiguration sharedInstance] userLogout];
                //展示登录页面
                //[UIHelper presentLoginPage];
                //[UIHelper hideProcessing];
            }
            return;
        }
        else {
            if (self.mydelegate != nil) {
                //显示错误消息
                [self.mydelegate requestDataFailed:[jsonObject objectForKey:@"Message"]];
            }
        }

        
        

    }
    @catch (NSException *exception) {
        return ;
    }
    @finally {
        
        
        return;
        
    }
    
    
    
    
    
    
    
    
    
    
}

-(NSDictionary *)getHeaderDic
{
    NSMutableDictionary *header = [[NSMutableDictionary alloc] init];
   // [header setValue:@"application/json;charset=utf-8" forKey:@"Content-Type"];
    
    
    [header setValue:[NSString stringWithFormat:@"Bearer %@",
                      [[AppConfiguration sharedInstance] AccessToken]
                      
                       ] forKey:@"Authorization"];
    return header;
}

/**
 *处理POST请求
 *
 */
- (void)httpPostApi:(NSString *)apiname withBody:(NSDictionary *)body withTag:(NSInteger)tag {
   
    
    
    
//    MKNetworkEngine *engin=[[MKNetworkEngine alloc] initWithHostName:SERVICE_ROOT_PATH customHeaderFields:[self getHeaderDic]];
//    
//    MKNetworkOperation *op=[engin operationWithURLString:apiname params:body httpMethod:@"POST"];
    
    
    MKNetworkEngine *engin=[[MKNetworkEngine alloc] initWithHostName:SERVICE_ROOT_PATH customHeaderFields:[self getHeaderDic]];
    
    
    MKNetworkOperation *op=[engin operationWithURLString:[NSString stringWithFormat:@"%@/%@",SERVICE_ROOT_PATH,apiname ] params:body httpMethod:@"POST"];

    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
         NSString *jsonStr = [completedOperation responseString];
        
         NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [self handleHttpResponse:jsonData withTag:tag];

        //////====
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"donwnload file error");
        // [self.tableView.header endRefreshing];
        
        
        if (self.mydelegate != nil) {
            if ([[error description] rangeOfString:@"Code=-1001"].length>0) {
                [self.mydelegate requestDataFailed:@"请求超时"];
                return;
            }
            [self.mydelegate requestDataFailed:@"网络不给力哦"];
        }

        
        
        
    }];
    
    [engin enqueueOperation:op];
    
    
    
}
/**
 *处理GET请求
 *
 */
- (void)httpGetApi:(NSString *)apiname withBody:(NSDictionary *)body withTag:(NSInteger)tag {
   
    
    
    MKNetworkEngine *engin=[[MKNetworkEngine alloc] initWithHostName:SERVICE_ROOT_PATH customHeaderFields:[self getHeaderDic]];
    
    
    MKNetworkOperation *op=[engin operationWithURLString:[NSString stringWithFormat:@"%@/%@",SERVICE_ROOT_PATH,apiname ] params:body httpMethod:@"GET"];
    
    
    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSString *jsonStr = [completedOperation responseString];
        
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [self handleHttpResponse:jsonData withTag:tag];
        
        //////====
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"donwnload file error");
        // [self.tableView.header endRefreshing];
        
        
        if (self.mydelegate != nil) {
            if ([[error description] rangeOfString:@"Code=-1001"].length>0) {
                [self.mydelegate requestDataFailed:@"请求超时"];
                return;
            }
            [self.mydelegate requestDataFailed:@"网络不给力哦"];
        }
        
        
        
        
    }];
    
    [engin enqueueOperation:op];
    
    
    
}



//- (void)httpGetApi:(NSString *)apiname withBody:(NSDictionary *)body withTag:(NSInteger)tag {
- (void)uploadImage:(NSString *)apiname withImage:(NSData *)imageData withBody:(NSDictionary *)body withTag:(NSInteger)tag
{
    
    
    
    MKNetworkEngine *engin=[[MKNetworkEngine alloc] initWithHostName:SERVICE_ROOT_PATH customHeaderFields:[self getHeaderDic]];
    
    
    MKNetworkOperation *op=[engin operationWithURLString:[NSString stringWithFormat:@"%@/%@",SERVICE_ROOT_PATH,apiname ] params:body httpMethod:@"POST"];

    
    //[op addFile:url forKey:@"img"];
    [op addData:imageData forKey:@"img"];
    
    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSString *jsonStr = [completedOperation responseString];
        
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [self handleHttpResponse:jsonData withTag:tag];
        
        //////====
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"donwnload file error");
        // [self.tableView.header endRefreshing];
        
        
        if (self.mydelegate != nil) {
            if ([[error description] rangeOfString:@"Code=-1001"].length>0) {
                [self.mydelegate requestDataFailed:@"请求超时"];
                return;
            }
            [self.mydelegate requestDataFailed:@"网络不给力哦"];
        }
        
        
        
        
    }];
    
    [engin enqueueOperation:op];
}


//
//- (void)uploadImage:(NSData *)imageData withTag:(NSInteger)tag {
//    NSURL *url = [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@", SERVICE_ROOT_PATH, @"/weblogic/system/upload/image?ext=png"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request addValue:[NSString stringWithFormat:@"iPad<>%@<>%f<>%f",
//                       [[AppConfiguration sharedInstance] AccessToken],
//                       [[AppConfiguration sharedInstance] Latitude],
//                       [[AppConfiguration sharedInstance] Longitude]] forHTTPHeaderField:@"Authorization"];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:imageData];
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //请求成功
//        [self handleHttpResponse:responseObject withTag:tag];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (self.mydelegate != nil) {
//            if ([[error description] rangeOfString:@"Code=-1001"].length>0) {
//                [self.mydelegate requestDataFailed:@"请求超时"];
//                return;
//            }
//            [self.mydelegate requestDataFailed:[NSString stringWithFormat:@"网络错误[%ld]", (long)operation.response.statusCode]];
//        }
//    }];
//    [operation start];
//}
//
//
///**
// *通过url下载图片
// *
// */
//+ (void)renderImageView:(UIImageView *)iv withURL:(NSString *)url defaultName:(NSString *)blankName {
//    //根据url创建文件名称
//    NSString *encodeName = [GTMBase64 stringByEncodingData:[url dataUsingEncoding:NSUTF8StringEncoding]];
//    encodeName = [encodeName stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
//    //判断文件路径是否存在，不存在则创建
//    NSString *imagepath = [UIHelper getCachedFilePath:@"cachedimages"];
//    NSFileManager *fm = [NSFileManager defaultManager];
//    if (![fm fileExistsAtPath:imagepath]) {
//        [fm createDirectoryAtPath:imagepath withIntermediateDirectories:YES attributes:0 error:nil];
//    }
//    imagepath = [imagepath stringByAppendingFormat:@"/%@", encodeName];
//    //判断图片是否存在，存在则不需再次下载
//    UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
//    if (image != nil) {
//        [iv setImage:image];
//        return;
//    }
//    //图片不存在，创建网络请求
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    //跳过安全认证
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    securityPolicy.allowInvalidCertificates = YES;
//    //创建请求操作
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    //设置安全级别
//    operation.securityPolicy = securityPolicy;
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //缓存图片
//        [responseObject writeToFile:imagepath atomically:YES];
//        UIImage *image = [UIImage imageWithData:responseObject];
//        
//        NSLog(@"Write to file:%@", imagepath);
//        //显示图片
//        if (image != nil) {
//            [iv setImage:image];
//        } else {
//            [iv setImage:[UIHelper getBundledImage:blankName]];
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Download image failed: %@", operation);
//    }];
//    [operation start];
//}





@end
