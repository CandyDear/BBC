//
//  HeadlineViewController.m
//  BBC_News
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HeadlineViewController.h"
#import "HeadlineModel.h"
#import "HeadLineCell.h"
#import "Commen.h"
#import "MJRefresh.h"
@interface HeadlineViewController (){
    int _index;
    UITableView *_tabbleView;
    NSMutableArray *_headlineData;
}

@end

@implementation HeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"英文头条";
    [self createTabbleView];
    [self requestWebData];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createTabbleView {
    
    
    
    _tabbleView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, kScreenHeight) style:UITableViewStylePlain];
    _tabbleView.delegate = self;
    _tabbleView.dataSource = self;
    
    [self.view addSubview:_tabbleView];
    [self _loadMoreData];
    //下拉刷新数据
    _tabbleView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(_loadFollowData)];
    
    //上拉加载更多数据
    _tabbleView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(_loadMoreData)];
    
    //构造URL
    NSString *httpUrl = @"http://cms.iyuba.com/cmsApi/getNewsList.jsp";
    
    NSString *httpArg = @"pageCounts=10&pageNum=1";
    
    [self request:httpUrl withHttpArg:httpArg];

    
    
}
#pragma mark - 下拉刷新数据，上拉加载更多数据 
- (void)_loadFollowData {
    //构造URL
    _index --;
    if (_index == 0) {
        _index = 1;
    }
    //构造URL
    NSString *httpUrl = @"http://cms.iyuba.com/cmsApi/getNewsList.jsp";
    
    NSString *httpArg = [NSString stringWithFormat:@"pageCounts=20&pageNum=%d",_index];
    
    [self request:httpUrl withHttpArg:httpArg];
}
- (void)_loadMoreData {
    
    [_headlineData removeLastObject];
    _index ++;

    //构造URL
    NSString *httpUrl = @"http://cms.iyuba.com/cmsApi/getNewsList.jsp";
    
    NSString *httpArg = [NSString stringWithFormat:@"pageCounts=20&pageNum=%d",_index];
    
    [self request:httpUrl withHttpArg:httpArg];
    
}
- (void)requestWebData {
    
    //构造URL
    
    NSString *httpUrl = @"http://cms.iyuba.com/cmsApi/getNewsList.jsp";
    
    NSString *httpArg = @"pageCounts=20&pageNum=1";
    
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
    
    _headlineData = [[NSMutableArray alloc] init];
    if (data != nil) {
        
        NSDictionary *dataDic = [[NSDictionary alloc] init];
        dataDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dataDic[@"data"];
        
        for (NSDictionary *dic in array) {
            
            HeadlineModel *headLine = [[HeadlineModel alloc] initWithDictionary:dic];
            [_headlineData addObject:headLine];
            
            //刷新数据
            [_tabbleView reloadData];
        }
         NSLog(@"数据%@",_headlineData);
        //        [_tableView.header endRefreshing];
        //        [_tableView.footer endRefreshing];
    }

}
#pragma mark - tabbleView dataSouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _headlineData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
//设置组的头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
    
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
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"headLineCell";
    HeadLineCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HeadLineCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.layer.cornerRadius = 5;
    cell.layer.borderWidth = 2;
    cell.layer.borderColor =  [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8].CGColor;
    cell.layer.shadowOffset = CGSizeMake(2, 2);
    cell.clipsToBounds = NO;
    cell.headLine = _headlineData[indexPath.section];
    return cell;
}

@end
