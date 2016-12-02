//
//  WaveViewController.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WaveViewController.h"
#import "WavaImageView.h"
#import "UIImageView+webCache.h"
#import "SixView.h"
#import "SevenView.h"

@interface WaveViewController ()<NSURLSessionDelegate>

@property (nonatomic , strong) WavaImageView * waveImageView;

@property (nonatomic , strong) NSMutableData * data;

@property (nonatomic , assign) CGFloat expectedContentLength;

@property (nonatomic , strong) SixView * sixView;

@property (nonatomic , strong) SevenView * sevenView;

@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"波纹";
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    self.data = [NSMutableData data];

    [self.view addSubview:self.waveImageView];
    
    /**
     *  sixView
     */
    
//    [self.view addSubview:self.sixView];
    
    [self.view addSubview:self.sevenView];

}

-(WavaImageView *)waveImageView{
    
    if (_waveImageView) {
        
        return _waveImageView;
    }
    
    _waveImageView = [[WavaImageView alloc]initWithFrame:CGRectMake(0, 64, KS_Width, KS_Height)];
    
//    [_waveImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img06.tooopen.com/images/20160830/tooopen_sl_177195524686.jpg"]];
    
   
    
    NSURL *url = [NSURL URLWithString:@"https://raw.githubusercontent.com/kishikawakatsumi/UCZProgressView/master/Example/Images/9O7A2669.png"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:url]];
    
    [task resume];
    
    
    return _waveImageView;
}

#pragma mark -- NSURLSessionDelegate

// 1.接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    // 允许处理服务器的响应，才会继续接收服务器返回的数据
    completionHandler(NSURLSessionResponseAllow);
    
    NSLog(@"expectedContentLength = %lld",response.expectedContentLength);
    
    self.expectedContentLength = response.expectedContentLength;
    
    NSLog(@"1");
}

// 2.接收到服务器的数据（可能调用多次）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    // 处理每次接收的数据
    
    NSLog(@"2222");
    
    NSLog(@"%@",data);
    
    [self.data appendData:data];
    
    CGFloat receivedDataLength = self.data.length;
    
    NSLog(@"ratio = %f" , receivedDataLength / self.expectedContentLength);
    
    self.sevenView.progress = receivedDataLength / self.expectedContentLength;
}

// 3.请求成功或者失败（如果失败，error有值）
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 请求完成,成功或者失败的处理
    
    NSLog(@"3");
    
    UIImage *image = [UIImage imageWithData:self.data];
    
    NSLog(@"width = %f   ,  height = %f",image.size.width , image.size.height);
    
    CGRect rect = self.waveImageView.frame;
    
    rect.size.width = KS_Width;
    
    rect.size.height = KS_Width / image.size.width * image.size.height;
    
    
    [self.waveImageView setFrame:rect];
    
    [self.waveImageView setCenter:self.view.center];

    [self.waveImageView setImage:image];
    
    NSLog(@"%@",task.response);
}

-(SixView *)sixView{
    
    if (_sixView) {
        
        return _sixView;
    }
    
    _sixView = [[SixView alloc]initWithFrame:CGRectMake(KS_Width / 2 - Iphone7(50), KS_Height / 2 - Iphone7(50), Iphone7(100), Iphone7(100))];
    
    _sixView.toValue = 0;
    
    return _sixView;
}

-(SevenView *)sevenView{
    
    if (_sevenView) {
        
        return _sevenView;
    }
    
    _sevenView = [[SevenView alloc]initWithFrame:self.view.frame];
    
    return _sevenView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end