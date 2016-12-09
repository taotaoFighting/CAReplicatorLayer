//
//  MorePicLodingViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MorePicLodingViewController.h"
#import "MorePicTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MorePicModel.h"
#import "UIView+MaskView.h"

@interface MorePicLodingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) NSMutableArray * dataArr;

@property (nonatomic , strong) UITableView * mainTableView;

@end

@implementation MorePicLodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTableView];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndentifier = @"cellIndentifier";
    
    MorePicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (!cell) {
        
        cell = [[MorePicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    MorePicModel *model = nil;
    
    if (self.dataArr.count > indexPath.row) {

        model = self.dataArr[indexPath.row];
    }
    
    [cell.lodingImageView setImage:model.image];
    
    return cell;
}

-(UITableView *)mainTableView{
    
    if (!_mainTableView) {
        
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KS_Width, KS_Height)];
        
        [_mainTableView setDelegate:self];
        
        [_mainTableView setDataSource:self];
    }
    
    return _mainTableView;
}

-(NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        
        _dataArr = [NSMutableArray array];
        
        MorePicModel *model = [[MorePicModel alloc]init];
        
        for (NSInteger i = 0; i < 100; i++) {
            
            UIImage *image = [UIImage imageNamed:@"IMG_0602.PNG"];
            
            model.image = image;
            
            CGSize size = image.size;
            
            model.cellHeight = KS_Width / size.width * size.height;
            
            [_dataArr addObject:model];
        }
    }
    
    return _dataArr;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MorePicModel *model = self.dataArr[indexPath.row];
    
    NSLog(@"model.cellHeight%lu = %f",indexPath.row,model.cellHeight);
    
    return model.cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
