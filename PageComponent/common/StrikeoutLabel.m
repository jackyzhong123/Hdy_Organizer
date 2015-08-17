//
//  StrikeoutLabel.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "StrikeoutLabel.h"

@implementation StrikeoutLabel



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.strikeThroughEnabled = YES;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:rect];
    CGSize textSize = [[self text] sizeWithFont:[self font]];
    CGFloat strikeWidth = textSize.width;
    
    CGRect lineRect;
    if ([self textAlignment] == NSTextAlignmentRight)
    {
        if (self.lineBottom) {
            lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2 + textSize.height/2, strikeWidth, 1);
        }
        else {
            lineRect = CGRectMake(rect.size.width - strikeWidth, rect.size.height/2, strikeWidth, 1);
        }
    }
    else if ([self textAlignment] == NSTextAlignmentCenter)
    {
        if (self.lineBottom) {
            lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2 + textSize.height/2, strikeWidth, 1);
        }
        else {
            lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, rect.size.height/2, strikeWidth, 1);
        }
    }
    else
    {
        if (self.lineBottom) {
            lineRect = CGRectMake(0, rect.size.height/2 + textSize.height/2, strikeWidth, 1);
        }
        else {
            lineRect = CGRectMake(0, rect.size.height/2, strikeWidth, 1);
        }
    }
    
    if (self.strikeThroughEnabled)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [self textColor].CGColor);
        CGContextFillRect(context, lineRect);
    }
}





@end
