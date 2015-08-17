//
//  ProcessingView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "ProcessingView.h"

@implementation ProcessingView



- (void)drawRect:(CGRect)rect {
    if (self.viewbg == nil) {
        self.viewbg = [[UIView alloc] initWithFrame:rect];
        [self.viewbg setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [self.viewbg setBackgroundColor:[UIColor blackColor]];
        self.viewbg.alpha = 0.1f;
        [self addSubview:self.viewbg];
    }
    if (self.imagebg == nil) {
        self.imagebg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toast_info.png"]];
        [self.imagebg setFrame:CGRectMake(0, 0, 120, 120)];
        [self.imagebg setCenter:CGPointMake(rect.size.width/2, rect.size.height/2)];
        [self.imagebg setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin];
        [self addSubview:self.imagebg];
        self.imagebg.layer.masksToBounds = YES;
        self.imagebg.layer.cornerRadius = 8.0f;
    }
    if (self.indicator == nil) {
        self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.indicator setCenter:CGPointMake(rect.size.width/2, rect.size.height/2)];
        [self.indicator setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin];
        [self addSubview:self.indicator];
        [self.indicator startAnimating];
    }
    [self setBackgroundColor:[UIColor clearColor]];
}




@end
