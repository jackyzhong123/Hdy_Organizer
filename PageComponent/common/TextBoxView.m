//
//  TextBoxView.m
//  SercleClient
//
//  Created by GUZUQIANG on 3/24/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "TextBoxView.h"

@implementation TextBoxView


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

- (void)setRoundedAndLineType {
    self.layer.borderWidth= 1.0f;
    self.layer.cornerRadius = 6.0f;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, self.insetX, self.insetY);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , self.insetX, self.insetY);
}

@end
