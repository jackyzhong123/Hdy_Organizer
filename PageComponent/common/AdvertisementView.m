//
//  AdvertisementView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 5/18/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "AdvertisementView.h"
#import "AdvertisementModel.h"

@implementation AdvertisementView


- (void)loadContent:(NSMutableArray *)list {
    self.itemList = list;
    if (self.scroll == nil) {
        self.scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scroll.pagingEnabled = YES;
        self.scroll.showsHorizontalScrollIndicator = NO;
        self.scroll.delegate = self;
        [self addSubview:self.scroll];
    }
    for (int i=0; i<[self.itemList count]; i++) {
        AdvertisementModel *item = [self.itemList objectAtIndex:i];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        [self.scroll addSubview:imageV];
       // [WebRequestHelper renderImageView:imageV withURL:item.ImageUrl defaultName:@"empty_image"];
    }
    self.scroll.contentSize = CGSizeMake(self.frame.size.width*[self.itemList count], self.frame.size.height);
    if (self.pager == nil) {
        self.pager = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 90, self.frame.size.width, 30)];
        [self addSubview:self.pager];
    }
    self.pager.numberOfPages = [self.itemList count];
    [self bringSubviewToFront:self.pager];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGRect frame = self.bounds;
    float currentFraPage = self.scroll.contentOffset.x / frame.size.width;
    long newPageIndex = lround(currentFraPage);
    if (self.currentPageIndex != newPageIndex) {
        self.currentPageIndex = newPageIndex;
        self.pager.currentPage = self.currentPageIndex;
    }
}



@end
