//
//  WebRequestHelper.h
//  AppScenicSpot
//
//  Created by GUZUQIANG on 12/27/13.
//  Copyright (c) 2013 edonesoft. All rights reserved.
//

#import <Foundation/Foundation.h>

//代理方法
@protocol WebRequestDelegate <NSObject>

@optional

//请求成功
- (void)requestDataComplete:(id)response requestTag:(NSInteger)tag;
//请求失败
- (void)requestDataFailed:(NSString *)error;
//图片下载完成



@end


@interface WebRequestHelper : NSObject


@property (assign) id<WebRequestDelegate> mydelegate;

//处理POST请求
- (void)httpPostApi:(NSString *)url withBody:(NSDictionary *)body withTag:(NSInteger)tag;
//处理GET请求
- (void)httpGetApi:(NSString *)apiname withBody:(NSDictionary *)body withTag:(NSInteger)tag;
//通过url下载图片

//上传图片
- (void)uploadImage:(NSString *)apiname withImage:(NSData *)imageData withBody:(NSDictionary *)body withTag:(NSInteger)tag;






@end
