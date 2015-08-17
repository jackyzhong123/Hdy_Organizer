//
//  ZbarOverlayView.h
//  DepponDemo
//
//  Created by GUZUQIANG on 7/25/14.
//  Copyright (c) 2014 edonesoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZbarOverlayView : UIView


@property (strong, nonatomic) UIImageView *imageWindow;
@property (strong, nonatomic) UIImageView *imageLine;
@property (strong, nonatomic) UILabel *lblText;


- (void)lineDown;


@end
