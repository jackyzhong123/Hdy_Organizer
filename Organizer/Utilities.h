//
//  Utilities.h
//  Jacky
//
//  Created by Sky on 15/6/16.
//  Copyright (c) 2015年 Jacky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject


+(NSString *)getUniqueStrByUUID;

+(NSString *)getServerHost;

+(NSString *)urlDecode:(NSString*)str;

+(void) saveLocalStr:(NSString *)str withKey:(NSString *)key;

+(NSMutableArray *) getFunctionBlockForOrg;

@end
