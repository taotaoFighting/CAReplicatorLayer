//
//  SecondView.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "SecondView.h"

@interface SecondView()
{
    CAShapeLayer *_shapeLayer;
}


@end

@implementation SecondView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor blueColor]];
        
        [self initLayer];
    }
    
    return self;
}

- (void) initLayer{
    
    /**
     *  使用CAShapeLayer和 UIBezierPath 配合是用GPU绘图 这样不会暂用cpu 不会造成卡顿。
     */
    
    CGRect rect = CGRectMake(5, 5, self.bounds.size.width - 20, self.bounds.size.height - 20);
    
    _shapeLayer = [CAShapeLayer layer];
    
    [_shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    
    [_shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];
    
    [_shapeLayer setLineWidth:2.0f];
    
    [_shapeLayer setFrame:rect];
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:rect];
    
    _shapeLayer.path = aPath.CGPath;
    
    [self.layer addSublayer:_shapeLayer];
}


//-(void)drawRect:(CGRect)rect{
    
    
    /**
     *  CAShapeLayer属于CoreAnimation框架，通过GPU来渲染图形，不消耗内存，节省性能;drawRect属于CoreGraphics框架，占用CPU，性能消耗大
     */
    /*UIColor *color = [UIColor cyanColor];
    
    [color set];
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 10)];
    
    [aPath setLineWidth:3.0f];
    
    [aPath setLineCapStyle:kCGLineCapRound];
    
    [aPath setLineJoinStyle:kCGLineJoinRound];
    
    **
     *  stroke -->填充边缘  fill-->填充整个区域
     *
    
    [aPath stroke];*/
    
    
//}

@end
