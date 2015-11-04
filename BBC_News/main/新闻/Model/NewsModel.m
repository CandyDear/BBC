//
//  NewsModel.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NewsModel.h"
//@property (nonatomic, copy) NSString *descCn;      //新闻描述
//@property (nonatomic, copy) NSString *title;       //新闻标题
//@property (nonatomic, copy) NSString *bbcID;       //新闻ID
//@property (nonatomic, copy) NSString *titleE;      //英文图标
//@property (nonatomic, copy) NSString *creatTime;   //发布时间
//@property (nonatomic, assign) NSInteger *readCount;
@implementation NewsModel
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        _pic = dic[@"Pic"];
        _descCn = dic[@"DescCn"];
        _title = dic[@"Title_cn"];
        _bbcID = dic[@"BbcId"];
        _titleE = dic[@"Title"];
        _creatTime = dic[@"CreatTime"];
        _readCount = [dic[@"ReadCount"] integerValue];
    }
    return self;
}

@end
