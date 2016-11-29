//
//  SixView.m
//  CAReplicatorLayer
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SixView.h"

#define DEGREE_TO_RADIANS(c) c * (M_PI / 180)

@interface SixView()

@property (nonatomic , strong) CAShapeLayer * shapeLayer;

@end

@implementation SixView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor blackColor]];
        
        self.endValue = 0;
        
        [self initLayer];
        
        [self startAnimationWithTovalue:1.0f];
        
        [self setUpTimer];
    }
    
    return self;
}

-(void) setUpTimer{
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pruductToValue) userInfo:nil repeats:YES];
}

-(void) pruductToValue{
    
    CGFloat tovalue = (random() % 10) / 10.0f;
    
    NSLog(@"tovalue = %f",tovalue);
    
    self.toValue = tovalue;
    
}

-(void)setToValue:(CGFloat )value{
    
    /**
     *  0 <= tovalue <= 1
     */
    
    [self startAnimationWithTovalue:value];
    
    self.endValue = value;
    
}

- (void) startAnimationWithTovalue:(CGFloat) tovalue{
    
    [self.shapeLayer setStrokeEnd:tovalue];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    [basicAnimation setDuration:3.0f];
    
    /**
     *  起始动画位置 （相对于路径的位置）
     */
    
    [basicAnimation setFromValue:@(self.endValue)];
    
    /**
     *  结束动画位置 （相对于路径的位置）
     */
    
    [basicAnimation setToValue:@(tovalue)];
    
    [basicAnimation setRemovedOnCompletion:YES];
    
    [self.shapeLayer addAnimation:basicAnimation forKey:@"shapeLayer"];
    
}

- (void)initLayer{
    
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.shapeLayer = [CAShapeLayer layer];
    
    [self.shapeLayer setFrame:rect];
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat r = center.x / 3 * 2;
    
    CGFloat startAngle = DEGREE_TO_RADIANS(120);
    
    CGFloat endAngle = DEGREE_TO_RADIANS(420);
    
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
