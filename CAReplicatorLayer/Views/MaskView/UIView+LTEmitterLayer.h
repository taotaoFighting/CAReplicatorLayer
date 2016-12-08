//
//  UIView+LTEmitterLayer.h
//  CAReplicatorLayer
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Emiter: UIButton

- (instancetype)initWithTargetView:(UIView *)view;

@end

@interface UIView (LTEmitterLayer)

-(void) setUpAnimation;

@end
