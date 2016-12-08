//
//  EmiterViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "EmiterViewController.h"
#import "UIView+LTEmitterLayer.h"

@interface EmiterViewController ()

@property (nonatomic , strong) UIButton * emiterButton;

@end

@implementation EmiterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self.view addSubview:self.emiterButton];
}

-(UIButton *)emiterButton{
    
    if (!_emiterButton) {
        
        _emiterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGRect rect = CGRectMake(100 , 100, 200, 200);
        
        [_emiterButton setFrame:rect];
        
        [_emiterButton setBackgroundColor:[UIColor lightGrayColor]];
        
        [_emiterButton setUpAnimation];
    }
    
    return _emiterButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
