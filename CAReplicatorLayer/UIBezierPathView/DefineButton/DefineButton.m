//
//  DefineButton.m
//  CAReplicatorLayer
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DefineButton.h"
#import "FourView.h"

@interface DefineButton()<CAAnimationDelegate>

@property (nonatomic , strong) CAShapeLayer * shapeLayer;

@property (nonatomic , strong) CADisplayLink * displayLink;

@property (nonatomic , strong) NSMutableArray *fourViewArr;

@property (nonatomic) BOOL isCloke;

@end

@implementation DefineButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor blackColor]];
        
//        [self initLayer];
        
    }
    
    return self;
}


-(void) initLayerc{
    
    CGRect rect = CGRectMake((self.bounds.size.width - self.bounds.size.height/15) / 2, (self.bounds.size.height - self.bounds.size.height/15) / 2, self.bounds.size.height/15,  self.bounds.size.height/15);
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    
    [shapeLayer setFrame:rect];
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.bounds.size.height/15,  self.bounds.size.height/15)];
    
    [shapeLayer setPath:aPath.CGPath];
    
    [shapeLayer setStrokeColor:[[self randomColor] CGColor]];
    
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    [shapeLayer setLineWidth:.1f];
    
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    [basicAnimation setDuration:3];
    
    basicAnimation.fromValue = @(.1);
    
    basicAnimation.toValue = @(14.5);
    
    [basicAnimation setRemovedOnCompletion:NO];
    
    [basicAnimation setFillMode:kCAFillModeRemoved];
    
    [basicAnimation setDelegate:self];
    
    [shapeLayer addAnimation:basicAnimation forKey:@"button"];
}


-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    NSLog(@"beginTrackingWithTouch");
    
    NSLog(@"x = %f   y = %f",[touch locationInView:self].x ,[touch locationInView:self].y);
    
    [self initLayerc];

    
    return YES;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
   
    NSLog(@"continueTrackingWithTouch");
    
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    NSLog(@"endTrackingWithTouch");
}


-(void)animationDidStart:(CAAnimation *)anim{
    
    NSLog(@"animationDidStart");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    for (NSInteger i = 0; i < self.layer.sublayers.count; i++) {
        
        id obj = self.layer.sublayers[i];
        
        if ([obj isKindOfClass:[CAShapeLayer class]]) {
            
            [obj removeFromSuperlayer];
            
            obj = nil;
            
            return;
        }
    }
    

    
    NSLog(@"animationDidStop   %@",anim);
}

-(void) initLayer{
    
//    [self.layer addSublayer:self.shapeLayer];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(start)];
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void) start{
    

    if (self.fourViewArr.count > 0) {
        
        for (NSInteger i = 0; i < self.fourViewArr.count; i++) {
            
            FourView *fourView = self.fourViewArr[i];
            
            if (fourView) {
                
                fourView.transform =  CGAffineTransformScale(fourView.transform, 1.03, 1.03);
                
                NSLog(@"(%f,%f,%f,%f)",fourView.frame.origin.x,fourView.frame.origin.y ,fourView.frame.size.width , fourView.frame.size.height);
                
            }
            
            
            if (fourView.frame.size.width > 100) {
                
                [fourView removeFromSuperview];
                
                [self.fourViewArr removeObject:fourView];
                
                
            }

        }
    }
    
    
    
    
    
    
    /*CGFloat strokeEnd = self.shapeLayer.strokeEnd;
    
    CGFloat strokeStart = self.shapeLayer.strokeStart;
    
    if (self.isCloke) {
        
        //逆时针 -
        
        strokeEnd -= 0.003;
        
        strokeStart -= 0.003;
        
    }else{
        
        //顺时针 +
        strokeEnd += 0.003;
        
        strokeStart += 0.003;
    }
    
    if (strokeEnd >= 1.0f) {
        
        self.isCloke = !self.isCloke;
    }
    
    if (strokeStart <= 0.0f) {
        
        self.isCloke = !self.isCloke;
    }
    
    [self.shapeLayer setStrokeStart:strokeStart];
    
    [self.shapeLayer setStrokeEnd:strokeEnd];*/
}

-(CAShapeLayer *)shapeLayer{
    
    if (_shapeLayer) {
        
        return _shapeLayer;
    }
    
    CGRect rect = CGRectMake(0, 0, 20, self.bounds.size.height);
    
    _shapeLayer = [[CAShapeLayer alloc]init];
    
    [_shapeLayer setFrame:rect];
    
    CGRect rectPath = CGRectMake(1, 1, self.bounds.size.width - 2, self.bounds.size.height - 2);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:rectPath];
    
    [_shapeLayer setPath:aPath.CGPath];
    
    [_shapeLayer setLineWidth:2.0f];
    
    [_shapeLayer setStrokeColor:[[self randomColor] CGColor]];
    
    [_shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    [_shapeLayer setStrokeStart:0];
    
    [_shapeLayer setStrokeEnd:.5f];
    
    _shapeLayer.lineCap = kCALineCapRound;
    
    _shapeLayer.lineJoin = kCALineCapRound;
    

    return _shapeLayer;
}

-(NSMutableArray *)fourViewArr{
    
    if (_fourViewArr) {
        
        return _fourViewArr;
    }
    
    _fourViewArr = [NSMutableArray array];
    
    return _fourViewArr;
}


-(UIColor *) randomColor{
    
    CGFloat r = (CGFloat)(random() % 255) / 255.0f;
    
    CGFloat g = (CGFloat)(random() % 255) / 255.0f;
    
    CGFloat b = (CGFloat)(random() % 255) / 255.0f;
    
    NSLog(@"r= %f g = %f b = %f",r,g,b);
    
  return  [UIColor colorWithRed:r green:g blue:b alpha:.9];
}


@end
