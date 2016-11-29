//
//  FirstView.m
//  CAReplicatorLayer
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        
    }
    
    return self;
    
}

-(void)drawRect:(CGRect)rect{
    
    [[UIColor redColor]setFill];
    
    UIRectFill(CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
}

@end
