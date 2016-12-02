//
//  SevenView.h
//  CAReplicatorLayer
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevenView : UIView

@property (nonatomic) IBInspectable BOOL indeterminate;

@property (nonatomic) IBInspectable CGFloat progress;

@property (nonatomic) IBInspectable BOOL showsText; // UI_APPEARANCE_SELECTOR;

@property (nonatomic) IBInspectable CGFloat lineWidth; // UI_APPEARANCE_SELECTOR;
@property (nonatomic) IBInspectable CGFloat radius; // UI_APPEARANCE_SELECTOR;
@property (nonatomic) IBInspectable UIColor *tintColor; // UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIView *backgroundView; // UI_APPEARANCE_SELECTOR;

@property (nonatomic, readonly) UILabel *textLabel; // UI_APPEARANCE_SELECTOR;
@property (nonatomic) IBInspectable UIColor *textColor; // UI_APPEARANCE_SELECTOR;
@property (nonatomic) IBInspectable CGFloat textSize; // UI_APPEARANCE_SELECTOR;

@property (nonatomic) UIBlurEffect *blurEffect NS_AVAILABLE_IOS(8_0); // UI_APPEARANCE_SELECTOR;
@property (nonatomic) IBInspectable BOOL usesVibrancyEffect; // UI_APPEARANCE_SELECTOR;

@property (nonatomic, copy) void(^animationDidStopBlock)();

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
