//
//  NewViewController.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NewViewController.h"
#import "NewsTableViewCell.h"
#import "DetailViewController.h"
#import "NewsModel.h"
#import "MJRefresh.h"
#import "Commen.h"
@interface NewViewController () {
    int _index;
    int _indexP;
    UITableView *_tableView;
    NSMutableArray *_newsData;
    NSMutableData *_receveData;
    NSURLConnection *_connection;
}

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavItem];
    _index = 0;
    _indexP = 0;
    [self creatTabbleView];
    [self createButton];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];

}
#pragma mark - 创建按钮
- (void)createButton {
    //右边的两个按钮
    UIButton *findBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    findBtn.frame = CGRectMake(kScreenWidth / 2 + 17 + 30, 0, 27, 27);
    [findBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    findBtn.tag = 300;
    [findBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *findItem = [[UIBarButtonItem alloc] initWithCustomView:findBtn];
    UIButton *voiceBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    voiceBtn.frame = CGRectMake(kScreenWidth / 2 + 33 + 17 + 30, 0, 33, 33);
    [voiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
    voiceBtn.tag = 400;
    [voiceBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *voiceItem = [[UIBarButtonItem alloc] initWithCustomView:voiceBtn];
    self.navigationItem.rightBarButtonItems = @[findItem,voiceItem];
}
#pragma mark - 按钮的响应方法
- (void)buttonAction:(UIButton *)btn {
    if (btn.tag == 300) {
        
    } else if (btn.tag == 400){
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)requestWebData {
    
    //构造URL
    NSString *httpUrl = @"http://apps.iyuba.com/minutes/titleNewApi.jsp";
    
    NSString *httpArg = @"maxid=0&type=android&format=json&pages=1&pageNum=20&parentID=0";
 
    [self request:httpUrl withHttpArg:httpArg];
    
}
#pragma mark - 网络请求方法

- (void)request:(NSString *)httpUrl withHttpArg:(NSString *)httpArg {
    //1.拼接url
    NSString *urlStr = [NSString stringWithFormat:@"%@?%@",httpUrl,httpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    
    //2.构造NSURLRequest及相关信息
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 60;
    
    //3.构造NSURLConnection，发送请求
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    _newsData = [[NSMutableArray alloc] init];
    if (data != nil) {
        
        NSDictionary *dataDic = [[NSDictionary alloc] init];
        dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dataDic[@"data"];
        
        NSLog(@"数据%@",array);
        for (NSDictionary *dic in array) {
            NewsModel *news = [[NewsModel alloc] initWithDictionary:dic];
            [_newsData addObject:news];
            [_tableView reloadData];
        }
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
    }

    
    
}


- (void)creatTabbleView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    [self _loadMoreData];
    //下拉刷新数据
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadFollowData)];
    
    //上拉加载更多数据
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    //构造URL
    NSString *httpUrl = @"http://apps.iyuba.com/minutes/titleNewApi.jsp";
    
    NSString *httpArg = @"maxid=0&type=android&format=json&pages=1&pageNum=20&parentID=0";
    
    [self request:httpUrl withHttpArg:httpArg];
}
#pragma mark - 网络加载数据
- (void)_loadFollowData {
    //构造URL
    _index --;
    if (_index == 0||_indexP >= 1) {
        _index = 1;
        _indexP--;
    }
    NSString *httpUrl = @"http://apps.iyuba.com/minutes/titleNewApi.jsp";
    
    NSString *httpArg = [NSString stringWithFormat:@"maxid=0&type=android&format=json&pages=%d&pageNum=20&parentID=0",_index];
    
    [self request:httpUrl withHttpArg:httpArg];
    
}
- (void)_loadMoreData {
    
    [_newsData removeLastObject];
    _index ++;
    _indexP ++;
    //构造URL
    NSString *httpUrl = @"http://apps.iyuba.com/minutes/titleNewApi.jsp";
    
    NSString *httpArg = [NSString stringWithFormat:@"maxid=0&type=android&format=json&pages=%d&pageNum=20&parentID=%d",_index,_indexP];
    
    [self request:httpUrl withHttpArg:httpArg];
    
}

#pragma mark - tabbleView Datasouce
//返回组个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _newsData.count;
}
//设置组的头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 8;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];
    return view;
}
//返回单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 210;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.layer.cornerRadius = 5;
    cell.layer.borderWidth = 2;
    cell.layer.borderColor =  [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8].CGColor;
    cell.layer.shadowOffset = CGSizeMake(2, 2);
    cell.clipsToBounds = NO;
    cell.newsModel = _newsData[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.indexPath = (NSInteger)_newsData[indexPath.section];
    NewsModel *news = [[NewsModel alloc] init];
    detailVC.titleE = news.titleE;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
@end
