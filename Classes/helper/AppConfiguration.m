//
//  AppConfig.m
//  app
//
//  Created by eric gu on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppConfiguration.h"



static AppConfiguration *sharedConfiguration = nil;


@implementation AppConfiguration


+ (AppConfiguration *)sharedInstance {
	@synchronized(self) {
		if (sharedConfiguration == nil) {
			[[self alloc] init];
		}
	}
	return sharedConfiguration;
}


- (id)init {
	if ([super init] != nil) {
		[self load];
	}
	return self;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self){
		if (sharedConfiguration == nil) {
			sharedConfiguration = [super allocWithZone:zone];
			return sharedConfiguration;
		}
	}
	return nil;
}
- (id)copyWithZone: (NSZone *)zone {
	return self;
}



- (void)load {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud objectForKey:@"access_token"] != nil) {
        self.AccessToken = [ud objectForKey:@"access_token"];
    } else {
        self.AccessToken = @"";
    }
    if ([ud objectForKey:@"Configuration_CurrentUID"] != nil) {
        self.CurrentUID = [[ud objectForKey:@"Configuration_CurrentUID"] integerValue];
    } else {
        self.CurrentUID = 0;
    }
   
}


- (BOOL)save {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (self.AccessToken != nil) {
        [ud setObject:self.AccessToken forKey:@"Configuration_Token"];
    } else {
        [ud removeObjectForKey:@"Configuration_Token"];
    }
    if (self.CurrentUID > 0) {
        [ud setObject:[NSNumber numberWithInteger:self.CurrentUID] forKey:@"Configuration_CurrentUID"];
    }else {
        [ud removeObjectForKey:@"Configuration_CurrentUID"];
    }
    
    return YES;
}

- (BOOL)isUserLogin {
    return (self.AccessToken != nil && [self.AccessToken length] > 0);
}


 


@end
