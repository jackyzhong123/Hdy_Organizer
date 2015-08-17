//
//  PagedScrollView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 5/19/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "PagedScrollView.h"

@implementation PagedScrollView


- (void)enablePaged {
    if (self.contentOffset.y < 0) {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
        return;
    }
    if (self.contentOffset.y > self.contentSize.height-self.frame.size.height) {
        [self setContentOffset:CGPointMake(0, self.contentSize.height-self.frame.size.height) animated:YES];
        return;
    }
    
    float positionDelta = (int)self.contentOffset.y % (int)self.cellViewHeight;
    float offsety = 0;
    if (positionDelta > self.cellViewHeight/4) {
        offsety = ((int)self.contentOffset.y / (int)self.cellViewHeight +1)*self.cellViewHeight;
    } else {
        offsety = ((int)self.contentOffset.y / (int)self.cellViewHeight)*self.cellViewHeight;
    }
    [self setContentOffset:CGPointMake(0, offsety) animated:YES];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (!self.touchBegan) {
        self.touchBegan = YES;
        self.touchFrom = [touch locationInView:self.parentView].y;
        self.contentOffsetFrom = self.contentOffset.y;
    } else {
        CGFloat delta = [touch locationInView:self.parentView].y - self.touchFrom;
        CGFloat offset = self.contentOffsetFrom-delta/3;
        if (offset < 0) {
            offset = 0;
        }
        [self setContentOffset:CGPointMake(0, offset) animated:NO];
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.touchBegan = NO;
    [self enablePaged];
}


@end
