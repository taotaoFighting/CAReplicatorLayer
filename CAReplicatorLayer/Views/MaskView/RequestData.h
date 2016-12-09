//
//  RequestData.h
//  CAReplicatorLayer
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RequestData : UIView <NSURLSessionDelegate>

typedef void(^Success)(UIImage *);

typedef void(^Fail)(UIImage *);


@end
