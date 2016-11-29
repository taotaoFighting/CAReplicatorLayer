//
//  ViewController.m
//  CAReplicatorLayer
//
//  Created by 槑 on 16/11/28.
//  Copyright © 2016年 槑. All rights reserved.
//

#import "ViewController.h"
#import "FirstView.h"
#import "SecondView.h"
#import "ThreeView.h"
#import "FourView.h"
#import "DefineCircle.h"
#import "SixView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) CAReplicatorLayer * replicator;

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) UITableView * mainTableView;

@property (nonatomic , strong) FirstView * firstView;

@property (nonatomic , strong) SecondView * secondView;

@property (nonatomic , strong) ThreeView * threeView;

@property (nonatomic , strong) FourView * fourView;

@property (nonatomic , strong) DefineCircle * defineCircle;

@property (nonatomic , strong) SixView * sixView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.view addSubview:self.mainTableView];
    
    /**
     *  CAShapeLayer属于CoreAnimation框架，通过GPU来渲染图形，不消耗内存，节省性能;drawRect属于CoreGraphics框架，占用CPU，性能消耗大
     */
    
    /**
     *  方形
     */
    [self.view addSubview:self.firstView];
    
    /**
     *  空方形
     */
    [self.view addSubview:self.secondView];
    
    /**
     *  三角形
     */
    [self.view addSubview:self.threeView];
    
    /**
     *  圆形
     */
    
    [self.view addSubview:self.fourView];
    
    /**
     *  自定义圆
     */
    [self.view addSubview:self.defineCircle];
    
    /**
     *  圆弧
     */
    [self.view addSubview:self.sixView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    [cell.textLabel setText:self.dataArr[indexPath.row]];
    
    return cell;
}

-(UITableView *)mainTableView{
    
    if (_mainTableView) {
        
        return _mainTableView;
    }
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KS_Width, KS_Height)];
    
    [_mainTableView setDataSource:self];
    
    [_mainTableView setDelegate:self];
    
    return _mainTableView;
}

-(NSMutableArray *)dataArr{
    
    if (_dataArr) {
        
        return _dataArr;
    }
    
    _dataArr = [NSMutableArray arrayWithObjects:@"方形", nil];
    
    return _dataArr;
}

-(SixView *)sixView{
    
    if (_sixView) {
        
        return _sixView;
    }
    
    _sixView = [[SixView alloc]initWithFrame:CGRectMake(KS_Width / 2 - 50, 370, 100, 100)];
    
    return _sixView;
}

-(DefineCircle *)defineCircle{
    
    if (_defineCircle) {
        
        return _defineCircle;
    }
    
    _defineCircle = [[DefineCircle alloc]initWithFrame:CGRectMake(KS_Width / 2 - 50, 260, 100, 100)];
    
    return _defineCircle;
}

-(FourView *)fourView{
    
    if (_fourView) {
        
        return _fourView;
    }
    
    _fourView = [[FourView alloc]initWithFrame:CGRectMake(KS_Width / 2 - 25, 200, 50, 50)];
    
    return _fourView;
}

-(ThreeView *)threeView{
    
    if (_threeView) {
        
        return _threeView;
    }
    
    _threeView = [[ThreeView alloc]initWithFrame:CGRectMake(KS_Width / 2 - 25, 140, 100, 50)];
    
    return _threeView;
}

-(SecondView *)secondView{
    
    if (_secondView) {
        
        return _secondView;
    }
    
    _secondView = [[SecondView alloc]initWithFrame:CGRectMake(KS_Width / 2 - 25, 80, 100, 50)];
    
    return _secondView;
}

-(FirstView *)firstView{
    
    if (_firstView) {
        
        return _firstView;
    }
    
    _firstView = [[FirstView alloc]initWithFrame:CGRectMake(KS_Width / 2 - 25, 20, 100, 50)];
    
    return _firstView;
}

- (void)setButton{
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startButton setFrame:CGRectMake(KS_Width / 2 - 40, 80, 40, 80)];
    
    [startButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    
    [startButton.layer setCornerRadius:3];
    
    [startButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [startButton setBackgroundColor:[UIColor whiteColor]];
    
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    
    [startButton addTarget:self action:@selector(startButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startButton];

}

-(void) startButtonTouchUpInside:(UIButton *)sender{
    
    
}

-(void) repicationLayer{
    
    /**
     *  love 路径
     */
    
    UIBezierPath *lovaPath = [UIBezierPath bezierPath];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
