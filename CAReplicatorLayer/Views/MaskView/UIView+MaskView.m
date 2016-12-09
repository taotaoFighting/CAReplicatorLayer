//
//  UIView+MaskView.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIView+MaskView.h"

@interface Mask()<CAAnimationDelegate>

@property (nonatomic , strong) CAShapeLayer * circleLayer;//圆形路径

@property (nonatomic, assign) CGFloat smallDiameter;//最小直径

@property (nonatomic, assign) CGFloat bigDiameter;//最大直径

@end

@implementation Mask

-(instancetype)initWithTargetView:(UIView *)view{
    
    self = [super initWithFrame:view.bounds];
    
    if (self) {
        
        [self initParamData];
    }
    
    return self;
}

-(void) initParamData{
    
    [self setBackgroundColor:[UIColor colorWithRed:100 green:100 blue:100 alpha:.5]];
    
    self.smallDiameter = 40.0f;
    
    self.bigDiameter = sqrt(CGRectGetWidth(self.bounds) * CGRectGetWidth(self.bounds) + CGRectGetHeight(self.bounds) * CGRectGetHeight(self.bounds));
    
    [self.layer addSublayer:self.circleLayer];
}

#pragma mark -- 开始遮罩消失动画
-(void) startAnimation{
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    /**
     *  理论上作为mask的layer不能有父layer，所以要remove掉
     */
    [self.circleLayer removeFromSuperlayer];
    
    /**
     *  添加layer到superview
     */
    self.superview.layer.mask = self.circleLayer;
    
    /**
     *  让圆的变大的动画
     */
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    UIBezierPath *toPath = [self pathWithDiameter:self.bigDiameter];
    
    pathAnimation.toValue = (id)toPath.CGPath;
    
    pathAnimation.duration = 1.0;
    
    /**
     *  让圆的线的宽度变大的动画，效果是内圆变小
     */
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(lineWidth))];
    
    lineWidthAnimation.toValue = @(self.bigDiameter);
    
    lineWidthAnimation.duration = 1.0;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    group.animations = @[pathAnimation, lineWidthAnimation];
    
    group.duration = 1.0;
    
    /**
     *  这两句的效果是让动画结束后不会回到原处，必须加
     */
    group.removedOnCompletion = NO;
    
    group.fillMode = kCAFillModeForwards;
    
    group.delegate = self;
    
    [self.circleLayer addAnimation:group forKey:@"revealAnimation"];
}

/**
 *  根据直径生成圆的path，注意圆点是self的中心点，所以（x，y）不是（0，0）
 */
- (UIBezierPath *)pathWithDiameter:(CGFloat)diameter {
    
    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake((CGRectGetWidth(self.bounds) - diameter) / 2, (CGRectGetHeight(self.bounds) - diameter) / 2, diameter, diameter)];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    self.superview.layer.mask = nil;
    
    [self removeFromSuperview];
    
    NSLog(@"动画结束");
}



-(CAShapeLayer *)circleLayer{
    
    if (_circleLayer) {
        
        return _circleLayer ;
    }
    
    _circleLayer = [CAShapeLayer layer];
    
    _circleLayer.fillColor = [UIColor clearColor].CGColor;//这个必须透明，因为这样内圆才是不透明的
    
    _circleLayer.strokeColor = [UIColor yellowColor].CGColor;//注意这个必须不能透明，因为实际上是这个显示出后面的图片了
    
    _circleLayer.path = [self pathWithDiameter:self.smallDiameter].CGPath;
    
    return _circleLayer;
}

@end


@implementation UIView (MaskView)

NSInteger const kLXMRevealViewTag = 9527;

- (void)setupForStart {
    
    Mask *revealView = [[Mask alloc] initWithTargetView:self];
    
    CGPoint center = self.center;
    
    revealView.center = center;
        
    revealView.tag = kLXMRevealViewTag;
    
    [self addSubview:revealView];
    
    [self bringSubviewToFront:revealView];
}

- (void)start {
    
    Mask *mask = (Mask *)[self viewWithTag:kLXMRevealViewTag];
    
    mask.center = self.center;
    
    [mask startAnimation];
}

@end
