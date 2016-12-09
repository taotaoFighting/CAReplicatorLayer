//
//  MorePicTableViewCell.m
//  CAReplicatorLayer
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MorePicTableViewCell.h"

@implementation MorePicTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"MorePicTableViewCell" owner:self options:nil] lastObject];
    }
    
    return self;
}


-(LodingImageView *)mainIamgeView{
    
    if (!_mainIamgeView) {
        
        
    }
    
    return _mainIamgeView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
