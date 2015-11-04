//
//  LeftViewController.m
//  BBC
//
//  Created by CandyDear on 15/10/29.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_data;
    UITableView *_tableView;
}

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _getTitles];
    [self _createTableView];
     self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];
}
-(void)_createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.backgroundColor = [UIColor darkGrayColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 150)];
    [self.view addSubview:_tableView];
}
-(void)_getTitles
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Person" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:filePath];
}
#pragma mark - UITableView dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = _data[section];
    NSArray *array = dic[@"teamer"];
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = _data[indexPath.section];
    NSArray *array = dic[@"teamer"];
    cell.textLabel.text = array[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 30, 30)];
    NSDictionary *dic = _data[section];
    label.text = dic[@"group"];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.textColor = [UIColor lightGrayColor];
    return label;
}
#pragma mark - UITableView delegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
