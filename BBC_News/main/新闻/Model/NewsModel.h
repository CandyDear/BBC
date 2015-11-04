//
//  NewsModel.h
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/*
"Category": “4",                                          //新闻种类
"DescCn": “英国女王伊丽莎白二世在白金汉宫的讲话中把新兴的中英关系形容为全球伙伴关系。她说，中国国家主席习近平的英国国事访问是一个决定性的时刻。",                                                 //新闻描述
"HotFlg": "0",
"PublishTime": "",
"Url": "",
"Title_cn": "习近平主席访英、 叙利亚冲突和图坦卡蒙的胡须”,       //新闻标题
 
"Sound": "458.mp3",

 "Pic":“http://static.iyuba.com/imagesminutes458.jpg",    //新闻图片

"BbcId": 458,                                             //新闻ID

"ReadCount": “4",                                         //阅读次数

"Title": "President Xi Jingping in the UK, Syrian conflict and Tutankhamun\u2019s beard”,                                       //英文图标

"CreatTime": "2015-10-23 00:00:00.0”                      //发布时间
}]
}
 */
@property (nonatomic, copy) NSString *pic;         //新闻图标
@property (nonatomic, copy) NSString *descCn;      //新闻描述
@property (nonatomic, copy) NSString *title;       //新闻标题
@property (nonatomic, copy) NSNumber *bbcID;       //新闻ID
@property (nonatomic, copy) NSString *titleE;      //英文图标
@property (nonatomic, copy) NSString *creatTime;   //发布时间
@property (nonatomic, assign) NSInteger readCount; //阅读次数

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
