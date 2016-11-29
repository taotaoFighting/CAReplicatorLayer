//
//  FirstView.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
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
