//
//  CVCFunction.m
//  Organizer
//
//  Created by Sky on 15/8/15.
//  Copyright (c) 2015年 活动邮. All rights reserved.
//

#import "CVCFunction.h"

@implementation CVCFunction


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       // self.restorationIdentifier = @"cvCell";
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingNone;
        
        CGFloat borderWidth = 3.0f;
        UIView *bgView = [[UIView alloc] initWithFrame:frame];
        bgView.layer.borderColor = [UIColor redColor].CGColor;
        bgView.layer.borderWidth = borderWidth;
        self.selectedBackgroundView = bgView;
        
        CGRect myContentRect = CGRectInset(self.contentView.bounds, borderWidth, borderWidth);
        
        UIView *myContentView = [[UIView alloc] initWithFrame:myContentRect];
        myContentView.backgroundColor = [UIColor whiteColor];
        myContentView.layer.borderColor = [UIColor colorWithWhite:0.5f alpha:1.0f].CGColor;
        myContentView.layer.borderWidth = borderWidth;
        [self.contentView addSubview:myContentView];
    }
    return self;
}

@end
