//
//  MorePicTableViewCell.h
//  CAReplicatorLayer
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LodingImageView.h"

@interface MorePicTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet LodingImageView *lodingImageView;

@property (nonatomic , strong) LodingImageView * mainIamgeView;


@end
