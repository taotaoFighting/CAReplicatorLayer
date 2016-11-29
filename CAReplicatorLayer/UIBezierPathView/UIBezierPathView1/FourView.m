//
//  FourView.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "FourView.h"

@implementation FourView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, self.bounds.size.width - 2, self.bounds.size.height - 2)];
    
    [aPath setLineWidth:2.0];
    
    [[UIColor redColor] set];
    
    [aPath stroke];
    
}

@end
