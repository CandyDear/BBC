//
//  BaseViewController.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "MMDrawerVisualState.h"
#import "UIViewController+MMDrawerController.h"
#import "Commen.h"
@interface BaseViewController ()
{
    UIView *_allView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavItem
{
    //左边的两个按钮
    UIButton *BBCBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BBCBtn.frame = CGRectMake(20, 0, 30, 44);
    [BBCBtn setTitle:@"BBC" forState:UIControlStateNormal];
    [BBCBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    BBCBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    BBCBtn.tag = 100;
    [BBCBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bbcItem = [[UIBarButtonItem alloc] initWithCustomView:BBCBtn];
    UIButton *allBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    allBtn.frame = CGRectMake(50, 0, 90, 44);
    [allBtn setTitle:@"全部" forState:UIControlStateNormal];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    allBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    allBtn.tag = 200;
    [allBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *allItem = [[UIBarButtonItem alloc] initWithCustomView:allBtn];
    
    self.navigationItem.leftBarButtonItems = @[bbcItem,allItem];
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
-(void)buttonAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if(sender.tag == 100)
    {
        //弹出左边视图
        MMDrawerController *mmDrawer = self.mm_drawerController;
        [mmDrawer openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    }
    else if(sender.tag == 200)
    {
        if(_allView == nil)
        {
            [self _createAllView];
            if(sender.selected)
            {
                _allView.hidden = NO;
            }
            else
            {
                _allView.hidden = YES;
            }
        }
        _allView.hidden = YES;
        
        if(!sender.selected)
        {
            _allView.hidden = NO;
        }
    }
}
-(void)_createAllView
{
    _allView = [[UIView alloc] initWithFrame:CGRectMake(50, 64, 90, self.view.bounds.size.height * 0.3)];
    _allView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_allView];
    NSArray *titles = @[@"全部",@"BBC六分钟英语",@"BBC新闻词汇",@"BBC地道英语",@"BBC新闻",@"BBC职场英语"];
    CGFloat height = (kScreenHeight * 0.3) / titles.count;
    for(int i = 0; i < titles.count;i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0,height * i , 90, height);
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(allButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 2;
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [_allView addSubview:button];
    }
    _allView.hidden = YES;
    
}
-(void)allButtonAction:(UIButton *)button
{
    _allView.hidden = YES;
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
