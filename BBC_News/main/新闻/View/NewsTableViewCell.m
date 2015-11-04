//
//  NewsTableViewCell.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - 复写set方法
- (void)setNewsModel:(NewsModel *)newsModel {
    if (_newsModel != newsModel) {
        _newsModel = newsModel;
        
        _titleE = _newsModel.titleE;
        _titleLabel.text = _newsModel.title;
        
        _readCountLabel.text = [NSString stringWithFormat:@"%ld次阅读",(long)_newsModel.readCount];
        if(_newsModel.creatTime.length >10)
        {
            _newsModel.creatTime = [_newsModel.creatTime substringToIndex:10];
            _creatTimeLabel.text = _newsModel.creatTime;
        }
        [_headerPic sd_setImageWithURL:[NSURL URLWithString:_newsModel.pic]];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
