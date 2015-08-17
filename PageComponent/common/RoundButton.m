//
//  RoundButton.m
//  AnnualCard
//
//  Created by GUZUQIANG on 5/29/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.layer.cornerRadius = 4.0f;
    self.clipsToBounds = YES;
}


@end
