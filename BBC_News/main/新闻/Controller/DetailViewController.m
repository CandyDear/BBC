//
//  DetailViewController.m
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "DetailViewController.h"
#import "Commen.h"
#import "NewsModel.h"
@interface DetailViewController (){
    UITableView *_tableView;
    UIScrollView *_scrollView;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _titleE;
 
}
- (void)itemBtnAction:(UIButton *)btn {
    NSLog(@"点击");
}
@end
