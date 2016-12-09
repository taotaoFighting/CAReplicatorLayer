//
//  LodingImageView.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LodingImageView.h"
#import "UIView+MaskView.h"

@implementation LodingImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupForStart];
    }
    
    return self;
}

-(void)setImage:(UIImage *)image{
    
    [super setImage:image];
    
    if (image) {
        
        [self setupForStart];
        
        [self start];
    }
    
    NSLog(@"%@",image);
}

@end
