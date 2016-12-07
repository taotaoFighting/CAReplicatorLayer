//
//  MainViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "WaveViewController.h"
#import "MaskViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) UITableView * mainTableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"layer层动画";
    
    [self.view addSubview:self.mainTableView];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller = nil;
    
    if (indexPath.row == 0) {
        
        controller = [[ViewController alloc]init];
        
    }else if (indexPath.row == 1){
        
        controller = [[WaveViewController alloc]init];
        
    }else if (indexPath.row == 2){
        
        controller = [[MaskViewController alloc]init];
    }
    
    [self.navigationController pushViewController:controller animated:YES];
}

-(UITableView *)mainTableView{
    
    if (_mainTableView) {
        
        return _mainTableView;
    }
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KS_Width, KS_Height)];
    
    [_mainTableView setDataSource:self];
    
    [_mainTableView setDelegate:self];
    
    return _mainTableView;
}

-(NSMutableArray *)dataArr{
    
    if (_dataArr) {
        
        return _dataArr;
    }
    
    _dataArr = [NSMutableArray arrayWithObjects:@"基本图形",@"加载进度条",@"遮罩层", nil];
    
    return _dataArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
