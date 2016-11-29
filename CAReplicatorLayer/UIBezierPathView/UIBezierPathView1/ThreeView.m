//
//  ThreeView.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "ThreeView.h"

@implementation ThreeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor blueColor]];
        
        [self initLayer];
    }
    return self;
}

- (void) initLayer{
    
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setFrame:rect];
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    [aPath setLineWidth:3.0f];
    
    [aPath moveToPoint:CGPointMake(10, 40)];
    
    [aPath addLineToPoint:CGPointMake(90, 40)];
    
    [aPath addLineToPoint:CGPointMake(50, 10)];
    
    [aPath addLineToPoint:CGPointMake(10, 40)];
    
    [aPath closePath];
    
    [shapeLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
    
    [shapeLayer setLineWidth:3.0f];
    
    shapeLayer.path = aPath.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    
}

/*-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    [aPath setLineWidth:3.0f];
    
    [aPath moveToPoint:CGPointMake(10, 40)];
    
    [aPath addLineToPoint:CGPointMake(90, 40)];
    
    [aPath addLineToPoint:CGPointMake(50, 10)];
    
    [aPath addLineToPoint:CGPointMake(10, 40)];
    
    [aPath closePath];
    
    [[UIColor whiteColor] set];
    
    [aPath stroke];
}*/

@end
