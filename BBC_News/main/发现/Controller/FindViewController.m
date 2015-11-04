//
//  FindViewController.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FindViewController.h"
#import "HeadlineViewController.h"
#import "SeriesViewController.h"
#import "Commen.h"

@interface FindViewController () {
    UITableView *_tableView;
    NSArray *_plistArray;
}

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BBC 发现";

    //加载tableView
    [self _createTableView];
}
#pragma mark - 创建tabelView 
- (void)_createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //读取plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"find.plist" ofType:nil];
    _plistArray = [NSArray arrayWithContentsOfFile:filePath];

}

#pragma mark - tabbleView dataSouce

//返回组的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _plistArray.count;
    
}

//返回每一组中单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = _plistArray[section];
    
    //取出members数组
    NSArray *members = dic[@"members"];
    
    return members.count;
}

//创建单元格个数
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSDictionary *dic = _plistArray[indexPath.section];
    
    //取出members数组
    NSArray *members = dic[@"members"];
    cell.textLabel.text = members[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.layer.cornerRadius = 10;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 0.5;
    cell.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.editing = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//组的头视图上的标题
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSDictionary *dic = _plistArray[section];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = dic[@"group"];
    return label;
    
}

//设置组的头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}
//- (void)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HeadlineViewController *headLineVC = [[HeadlineViewController alloc] init];
    if (indexPath.section == 0)
    {
        [self.navigationController pushViewController:headLineVC animated:YES];
    } else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[[SeriesViewController alloc] init] animated:YES];
            
        }else if (indexPath.row == 1){
            
        }else if (indexPath.row == 2) {
            
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            
        } else if (indexPath.row == 1) {
            
        }
    }else if (indexPath.section == 3) {
        
    }else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            
        } else if (indexPath.row == 1) {
            
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
