//
//  UIView+LTEmitterLayer.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIView+LTEmitterLayer.h"

@interface Emiter()

@property (nonatomic , strong) CAEmitterLayer * emiterLayer;

@property (nonatomic , strong) CAEmitterCell * emiterCell;

@end

@implementation Emiter

- (instancetype)initWithTargetView:(UIView *)view
{
    self = [super initWithFrame:view.bounds];
    
    if (self) {
        
        [self.layer addSublayer:self.emiterLayer];
    }
    
    return self;
}

-(CAEmitterLayer *)emiterLayer{
    
    if (!_emiterLayer) {
        
        _emiterLayer = [CAEmitterLayer layer];
        
        CGRect rect = self.bounds;
        
        [_emiterLayer setFrame:rect];
        
        [_emiterLayer setEmitterShape:kCAEmitterLayerLine];
        
        [_emiterLayer setPosition:CGPointMake(CGRectGetHeight(rect) * 1, CGRectGetWidth(rect) * 1)];
        
        [_emiterLayer setEmitterSize:rect.size];
        
        [_emiterLayer setEmitterCells:@[self.emiterCell]];
        
    }
    
    return _emiterLayer;
}

-(CAEmitterCell *)emiterCell{
    
    if (!_emiterCell) {
        
        _emiterCell = [CAEmitterCell emitterCell];
        
        _emiterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snowflake1"].CGImage);
        
        _emiterCell.birthRate = 100;
        
        _emiterCell.lifetime = 3.0f;
        
        [_emiterCell setYAcceleration:70.0f];
        
        [_emiterCell setXAcceleration:10.0f];
        
        [_emiterCell setVelocity:20.0f];
        
        [_emiterCell setEmissionLongitude:-M_PI_2];
        
        [_emiterCell setVelocityRange:200.0f];
        
        [_emiterCell setEmissionRange:M_PI_2];
        
        [_emiterCell setRedRange:.3];
        
        [_emiterCell setGreenRange:.3];
        
        [_emiterCell setBlueRange:.3];
        
        [_emiterCell setScale:.8];
        
        [_emiterCell setScaleRange:.8];
        
        [_emiterCell setScaleSpeed:-.15];
        
        [_emiterCell setAlphaRange:0.75];
        
        [_emiterCell setAlphaSpeed:-.15];
        
    }
    
    return _emiterCell;
}

@end

@implementation UIView (LTEmitterLayer)

-(void) setUpAnimation{
    
    Emiter *emiter = [[Emiter alloc]initWithTargetView:self];
    
    [self addSubview:emiter];
    
    [self bringSubviewToFront:emiter];
    
}

-(void) startAnimation{
    
    
}

@end
