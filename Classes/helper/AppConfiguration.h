//
//  AppConfig.h
//  app
//
//  Created by eric gu on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppConfiguration : NSObject {
}

+ (AppConfiguration *)sharedInstance;

@property (nonatomic, retain) NSString *AccessToken;
@property (readwrite) NSInteger CurrentUID;
 

//@property (readwrite, nonatomic) CGFloat Latitude;
//@property (readwrite, nonatomic) CGFloat Longitude;


- (void)load;

- (BOOL)save;

- (BOOL)isUserLogin;

- (void)userLogout;


@end
