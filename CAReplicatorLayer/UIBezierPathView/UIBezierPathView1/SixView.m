//
//  SixView.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "SixView.h"

#define DEGREE_TO_RADIANS(c) c * (M_PI / 180)

@interface SixView()<CAAnimationDelegate>

@property (nonatomic , strong) CAShapeLayer * shapeLayer;

@property (nonatomic , strong) UILabel * numberLabel;

@end

@implementation SixView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.endValue = 0;
        
        [self initLayer];
        
        [self startAnimationWithTovalue:1.0f];
        
        [self addSubview:self.numberLabel];
        
//        [self setUpTimer];
    }
    
    return self;
}

-(void) setUpTimer{
    
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(pruductToValue) userInfo:nil repeats:YES];
}

-(void) pruductToValue{
    
    CGFloat tovalue = (random() % 10) / 10.0f;
    
    NSLog(@"tovalue = %f",tovalue);
    
    self.toValue = tovalue;
    
}

-(void)setToValue:(CGFloat)toValue{
    

    
    [self.shapeLayer setStrokeEnd:toValue];
    
    [self.numberLabel setText:[NSString stringWithFormat:@"%.0f%%",toValue * 100]];
    
    if (toValue >= 1.0) {
        
        [self performFinishAnimation];
    }
    
//    self.endValue = toValue;
}

- (void) startAnimationWithTovalue:(CGFloat) tovalue{
    
    [self.shapeLayer setStrokeEnd:tovalue];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    [basicAnimation setDuration:.4f];
    
//    /**
//     *  起始动画位置 （相对于路径的位置）
//     */
//    
//    [basicAnimation setFromValue:@(self.endValue)];
//    
//    /**
//     *  结束动画位置 （相对于路径的位置）
//     */
//    
//    [basicAnimation setToValue:@(tovalue)];
    
//    basicAnimation.beginTime = CACurrentMediaTime() + 0.4;
    
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    basicAnimation.fillMode  = kCAFillModeForwards;
    
    basicAnimation.removedOnCompletion = NO;

    [self.shapeLayer addAnimation:basicAnimation forKey:@"path"];
    
}

- (void)initLayer{
    
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.shapeLayer = [CAShapeLayer layer];
    
    [self.shapeLayer setFrame:rect];
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat r = center.x / 3 * 2;
    
    CGFloat startAngle = DEGREE_TO_RADIANS(0);
    
    CGFloat endAngle = DEGREE_TO_RADIANS(360);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    /**
    *  设置圆弧两端的圆角
    */
    [aPath setLineCapStyle:kCGLineCapRound];
    
    self.shapeLayer.path = aPath.CGPath;
    
    [self.shapeLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
    
    [self.shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    self.shapeLayer.lineCap = kCALineCapRound;
    
    [self.shapeLayer setLineWidth:3.0f];
    
    [self.layer addSublayer:self.shapeLayer];
}

-(UILabel *)numberLabel{
    
    if (_numberLabel) {
        
        return _numberLabel;
    }
    
    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    
    [_numberLabel setTextColor:[UIColor whiteColor]];
    
    [_numberLabel setTextAlignment:NSTextAlignmentCenter];
    
    return _numberLabel;
}

- (void)performFinishAnimation {
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    
    [maskLayer setFillColor:[[UIColor redColor] CGColor]];
    
    [maskLayer setStrokeColor:[[UIColor yellowColor] CGColor]];
    
    CGPoint center = self.center;
    
    UIBezierPath *initialPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 1000)];
    
    [initialPath moveToPoint:center];
    
    [initialPath addArcWithCenter:center radius:self.bounds.size.width startAngle:0.0 endAngle:2.0 * M_PI clockwise:YES];
    
    [initialPath addArcWithCenter:center radius:self.bounds.size.width + 2 startAngle:0.0 endAngle:2.0 * M_PI clockwise:YES];
    
    initialPath.usesEvenOddFillRule = YES;
    
    maskLayer.path = initialPath.CGPath;
    
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    
//    self.layer.mask = maskLayer;
    
    [self.layer addSublayer:maskLayer];
    
    CGFloat outerRadius;
    
    CGFloat width = CGRectGetWidth(self.bounds) / 2;
    
    CGFloat height = CGRectGetHeight(self.bounds) / 2;
    
    if (width < height) {
        
        outerRadius = height * 1.5;
        
    } else {
        
        outerRadius = width * 1.5;
    }
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithRect:self.bounds];
    
    [finalPath moveToPoint:center];
    
    [finalPath addArcWithCenter:center radius:0.0 startAngle:0.0 endAngle:2.0 * M_PI clockwise:YES];
    
    [finalPath addArcWithCenter:center radius:outerRadius startAngle:0.0 endAngle:2.0 * M_PI clockwise:YES];
    
    finalPath.usesEvenOddFillRule = YES;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    animation.delegate = self;
    
    animation.toValue = (id)finalPath.CGPath;
    
    animation.duration = 10;
    
    animation.beginTime = CACurrentMediaTime() + 0.4;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    animation.fillMode  = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    [maskLayer addAnimation:animation forKey:@"re"];
}

/*-(void)drawRect:(CGRect)rect{
    
    [[UIColor whiteColor] set];
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat r = center.x / 3 * 2;
    
    CGFloat startAngle = 0;
    
    CGFloat endAngle = DEGREE_TO_RADIANS(180);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startAngle endAngle:endAngle clockwise:NO];
    
    [aPath setLineWidth:3.0f];
    
    **
     *  设置圆弧两端的圆角
     *
    [aPath setLineCapStyle:kCGLineCapRound];
    
    [aPath stroke];
}*/
@end
