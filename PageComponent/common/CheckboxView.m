//
//  CheckboxView.m
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import "CheckboxView.h"

@implementation CheckboxView


- (void)setChecked:(BOOL)check {
    self.btnCheck.selected = check;
}

- (BOOL)isChecked {
    return self.btnCheck.selected;
}


- (void)buttonCheckTouched:(id)sender {
    self.btnCheck.selected = !self.btnCheck.selected;
    if (self.mydelegate != nil) {
        [self.mydelegate checkboxValueChanged:self];
    }
}


- (void)setTitle:(NSString *)text {
    self.optionText = text;
    [self.lblTitle setText:text];
}


- (void)drawRect:(CGRect)rect {
    if (self.btnCheck == nil) {
        self.btnCheck = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        [self.btnCheck setImage:[UIImage imageNamed:@"cb_unchecked.png"] forState:UIControlStateNormal];
        [self.btnCheck setImage:[UIImage imageNamed:@"cb_checked.png"] forState:UIControlStateSelected];
        [self addSubview:self.btnCheck];
        [self.btnCheck addTarget:self action:@selector(buttonCheckTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (self.lblTitle == nil) {
        self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, self.frame.size.width-24, 24)];
        [self.lblTitle setBackgroundColor:[UIColor clearColor]];
        [self.lblTitle setFont:[UIFont systemFontOfSize:13.0f]];
        [self addSubview:self.lblTitle];
    }
}


@end
