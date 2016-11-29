//
//  DefineCircle.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/29.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "DefineCircle.h"
#import "FourView.h"

@interface DefineCircle()

@property (nonatomic , strong) FourView * fourView;

@end

@implementation DefineCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor blackColor]];
        
        [self calculatePoint];
        
    }
    
    return self;
}

- (void) calculatePoint{
    
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);//(x - x0)^2 + (y - y0)^2 = 1;
    
    CGFloat r2 = 400;
    
    for (NSInteger i = center.x - sqrt(r2); i <= center.x + sqrt(r2); i=i + 3) {
        
        CGFloat topY = center.y - sqrt((r2 - (i - center.x)*(i - center.x)));
        
        CGFloat buttomY = center.y + sqrt((r2 - (i - center.x)*(i - center.x)));
        
        CGPoint topPoint = CGPointMake(i, topY);
        
        CGPoint buttomPoint = CGPointMake(i, buttomY);
        
        [self setFourViewWithFrame:topPoint];
        
        [self setFourViewWithFrame:buttomPoint];
        
    }
}

- (void) setFourViewWithFrame:(CGPoint )point{
    
    self.fourView = [[FourView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    
    [self.fourView setCenter:point];
    
    
    [self addSubview:self.fourView];
}

//-(FourView *)fourView{
//    
////    if (_fourView) {
////        
////        return _fourView;
////    }
//    
//    _fourView = [[FourView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    
//    return _fourView;
//}




@end
