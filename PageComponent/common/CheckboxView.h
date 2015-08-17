//
//  CheckboxView.h
//  AnnualCard
//
//  Created by GUZUQIANG on 3/10/15.
//  Copyright (c) 2015 GUZUQIANG. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CheckBoxViewDelegate <NSObject>

- (void)checkboxValueChanged:(id)sender;

@end



@interface CheckboxView : UIView



@property (assign) id<CheckBoxViewDelegate> mydelegate;

@property (strong, nonatomic) NSString *optionText;
@property (strong, nonatomic) UIButton *btnCheck;
@property (strong, nonatomic) UILabel *lblTitle;


- (void)setTitle:(NSString *)text;

- (void)setChecked:(BOOL)check;

- (BOOL)isChecked;




@end
