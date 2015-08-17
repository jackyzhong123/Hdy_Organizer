//
//  NavigationLeftView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "NavigationLeftView.h"

@implementation NavigationLeftView



- (void)buttonBackTouched:(id)sender {
    [self.mydelegate buttonNavigationBackTouched];
}

- (void)load {
    if (self.btnBack == nil) {
        self.btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.btnBack setImage:[UIImage imageNamed:@"nav_btn_back.png"] forState:UIControlStateNormal];
        [self addSubview:self.btnBack];
        [self.btnBack setBackgroundColor:[UIColor clearColor]];
        [self.btnBack addTarget:self action:@selector(buttonBackTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)loadWithImage:(NSString *)imagename {
    if (imagename != nil && self.btnBack == nil) {
        self.btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.btnBack setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
        [self addSubview:self.btnBack];
        [self.btnBack setBackgroundColor:[UIColor clearColor]];
        [self.btnBack addTarget:self action:@selector(buttonBackTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
}


- (void)loadWithText:(NSString *)text {
    if (text != nil && self.btnBack == nil) {
        self.btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.btnBack setTitle:text forState:UIControlStateNormal];
        [self.btnBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnBack.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self addSubview:self.btnBack];
        [self.btnBack setBackgroundColor:[UIColor clearColor]];
        [self.btnBack addTarget:self action:@selector(buttonBackTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
}



@end
