//
//  RequestData.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RequestData.h"



@implementation RequestData

+(void)requestWithUrl:(NSString *)urlString WithSuccess:(Success) response WithFail:(Fail) fail{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:url]];
    
    [task resume];

    
}

#pragma mark -- NSURLSessionDelegate

// 1.接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    // 允许处理服务器的响应，才会继续接收服务器返回的数据
    completionHandler(NSURLSessionResponseAllow);
    
    NSLog(@"expectedContentLength = %lld",response.expectedContentLength);
    
    NSLog(@"1");
}

// 2.接收到服务器的数据（可能调用多次）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    // 处理每次接收的数据
    
    NSLog(@"2222");
    
    NSLog(@"%@",data);
    
}

// 3.请求成功或者失败（如果失败，error有值）
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 请求完成,成功或者失败的处理
    
    if (error) {
        
        NSLog(@"请求数据失败，请重试");
        
        return;
    }
    
    
    
    NSLog(@"%@",task.response);
}


@end
