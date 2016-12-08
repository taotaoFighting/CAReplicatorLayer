//
//  RealWaveViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/8.
//  Copyright © 2016年 apple. All rights reserved.
//


#import "RealWaveViewController.h"

@interface RealWaveViewController ()

@property (nonatomic , strong) NSMutableArray * dataArr;

@end

@implementation RealWaveViewController

- (void)viewDidLoad {
    
    /**
     *  使用须知 -- 1. 导入所需要的框架  2. 加入三方文件  3.
     */
    
    /**
     *  这句话要写在 [super viewDidLoad] 之前 不要问为什么  因为我也不知道
     */
    self.rippleImageName = @"background.jpg";
    
    [super viewDidLoad];

    self.dataArr = [NSMutableArray array];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    NSNumber *number = self.dataArr[indexPath.row];
    cell.textLabel.text = [number stringValue];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
