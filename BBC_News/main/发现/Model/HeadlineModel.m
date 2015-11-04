//
//  HeadlineModel.m
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HeadlineModel.h"

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

@implementation HeadlineModel
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        _pic = dic[@"Pic"];
        _titleE = dic[@"Title"];
        _titleC = dic[@"Title_cn"];
        _creatTime = dic[@"CreatTime"];
        _hardWeight = dic[@"HardWeight"];
        _readCount = [dic[@"ReadCount"] integerValue];
        _wordCount = [dic[@"WordCount"] integerValue];
    }
    return self;
}
@end
