//
//  HeadLineCell.h
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadlineModel.h"
/*
 @property (nonatomic, copy) NSString *pic;                      //新闻图片
 @property (nonatomic, copy) NSString *titleE;                   //英文标题
 @property (nonatomic, copy) NSString *titleC;                   //中文标题
 @property (nonatomic, copy) NSString *cteatTime;                //发布时间
 @property (nonatomic, copy) NSString *hardWeight;               //难度系数
 @property (nonatomic, assign) NSInteger wordCount;              //单词个数
 @property (nonatomic, assign) NSInteger readCount;
 */

@interface HeadLineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headLineImg;
@property (weak, nonatomic) IBOutlet UILabel *titleELabel;
@property (weak, nonatomic) IBOutlet UILabel *titleCLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hardWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;
@property (strong, nonatomic) HeadlineModel *headLine;

@end
