//
//  HeadLineCell.m
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//


/*
 @property (nonatomic, copy) NSString *pic;                      //新闻图片
 @property (nonatomic, copy) NSString *titleE;                   //英文标题
 @property (nonatomic, copy) NSString *titleC;                   //中文标题
 @property (nonatomic, copy) NSString *cteatTime;                //发布时间
 @property (nonatomic, copy) NSString *hardWeight;               //难度系数
 @property (nonatomic, assign) NSInteger wordCount;              //单词个数
 @property (nonatomic, assign) NSInteger readCount;
 */

#import "HeadLineCell.h"
#import "UIImageView+WebCache.h"
@implementation HeadLineCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setHeadLine:(HeadlineModel *)headLine {
    
    if (_headLine != headLine) {
        
        _headLine = headLine;
        
        //赋值
        _titleELabel.text = _headLine.titleE;
        _titleCLabel.text = _headLine.titleC;
        _wordCountLabel.text = [NSString stringWithFormat:@"单词:%li",_headLine.wordCount];
        _readCountLabel.text = [NSString stringWithFormat:@"阅读:%li",_headLine.readCount];
       _hardWeightLabel.text = [NSString stringWithFormat:@"难度:%@",_headLine.hardWeight];

        NSString *str = [NSString stringWithFormat:@"http://cms.iyuba.com/cms/news/image/%@",_headLine.pic];
        [_headLineImg sd_setImageWithURL:[NSURL URLWithString:str]];
        if(_headLine.creatTime.length > 5)
        {
            _headLine.creatTime = [_headLine.creatTime substringToIndex:10];
            _creatTimeLabel.text = _headLine.creatTime;
            
        }
 
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
