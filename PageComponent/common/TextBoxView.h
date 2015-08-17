//
//  TextBoxView.h
//  SercleClient
//
//  Created by GUZUQIANG on 3/24/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextBoxView : UITextField


@property (readwrite, nonatomic) CGFloat insetX;
@property (readwrite, nonatomic) CGFloat insetY;

- (void)setRoundedAndLineType;

@end
