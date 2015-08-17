//
//  ZbarOverlayView.m
//  DepponDemo
//
//  Created by GUZUQIANG on 7/25/14.
//  Copyright (c) 2014 edonesoft. All rights reserved.
//

#import "ZbarOverlayView.h"

@implementation ZbarOverlayView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Zbar_line"]];
        [self.imageLine setFrame:CGRectMake(0, 0, frame.size.width, 6)];
        [self.imageLine setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [self addSubview:self.imageLine];
        
        self.imageWindow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zbar_overlay"]];
        [self.imageWindow setFrame:frame];
        [self.imageWindow setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [self.imageWindow setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:self.imageWindow];
        
        self.lblText = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-160, self.frame.size.width, 60)];
        [self.lblText setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
        [self.lblText setTextColor:[UIColor blackColor]];
        [self.lblText setTextAlignment:NSTextAlignmentCenter];
        [self.lblText setFont:[UIFont fontWithName:@"Arial" size:15]];
        [self.lblText setText:@"Scan QR Code"];
        [self.lblText setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.lblText];
    }
    return self;
}


- (void)lineDown {
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.imageLine setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height-160)];
    }completion:^(BOOL complite){
        if (complite) {
            [self lineUp];
        }
    }];
}

- (void)lineUp {
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.imageLine setCenter:CGPointMake(self.frame.size.width/2, 60)];
    }completion:^(BOOL complete){
        if (complete) {
            [self lineDown];
        }
    }];
}

@end
