//
//  UIView+MaskView.h
//  CAReplicatorLayer
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Mask : UIImageView

-(instancetype)initWithTargetView:(UIView *)view;

-(void) startAnimation;

@end

@interface UIView (MaskView)

- (void)setupForStart;

- (void)start;

@end
