//
//  HeadlineViewController.h
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface HeadlineViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) NSInteger indexPath;
@end
