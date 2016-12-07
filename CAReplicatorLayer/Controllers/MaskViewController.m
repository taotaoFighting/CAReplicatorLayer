//
//  MaskViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MaskViewController.h"
#import "UIView+MaskView.h"

@interface MaskViewController ()
@property (nonatomic , strong) UIImageView * imageView;

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    
    [self.view addSubview:self.imageView];
    
}

-(UIImageView *)imageView{
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
        [_imageView setImage:[UIImage imageNamed:@"water.jpg"]];
        
        [_imageView setupForStart];
        
    }
    
    return _imageView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_imageView start];
    
    NSLog(@"touchesBegan");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
