//
//  HeadlineModel.h
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 "WordCount": "287",
 "TopicId": "125",
 "DescCn": "⼀一男⼦子⼊入室盗窃,脱光⾐衣服钻进被窝将男主⼈人
 吻醒,却发现对⽅方有枪。所以,谁让你去吻⼀一个正在睡觉的男⼈人啦!关键 是⼈人家还有枪啊!",
 "Flag": "1",
 "Title_cn": "裸男⼊入室盗窃 吻醒男主⼈人",
 "HardWeight": "8.4",
 "Title": "Naked suspect wakes sleeping man with kiss", "NewsId": "42179",
 "CreatTime": "2015-10-27 00:00:00.0",
 "Source": "iYuba",
 "Category": "121",
 "Sound": "",
 "Pic": "42179.jpg",
 "ReadCount": "93"
 */
@interface HeadlineModel : NSObject
@property (nonatomic, copy) NSString *pic;                      //新闻图片
@property (nonatomic, copy) NSString *titleE;                   //英文标题
@property (nonatomic, copy) NSString *titleC;                   //中文标题
@property (nonatomic, copy) NSString *creatTime;                //发布时间
@property (nonatomic, copy) NSString *hardWeight;                //难度系数
@property (nonatomic, assign) NSInteger wordCount;              //单词个数
@property (nonatomic, assign) NSInteger readCount;              //阅读次数
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
