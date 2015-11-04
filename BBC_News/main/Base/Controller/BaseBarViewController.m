//
//  BaseBarViewController.m
//  China_BBC
//
//  Created by mac on 15/10/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseBarViewController.h"
#import "BaseNaviViewController.h"
#import "Commen.h"
@interface BaseBarViewController ()

@end

@implementation BaseBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载子视图控制器
    [self _createControllers];
    
    //设置tabBar
    [self _createTabBar];
}

#pragma mark - 创建子控制视图
- (void)_createControllers {
    
    NSArray *name = @[@"News",@"Find"];
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i = 0; i < name.count; i ++) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name[i] bundle:nil];
        
        BaseNaviViewController *naviVC = [storyboard instantiateInitialViewController];
        
        [navArray addObject:naviVC];
        
    }
    self.viewControllers = navArray;
}

- (void)_createTabBar {
    //1.移除tabBar
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    //2.设置tabBar背景颜色
//    self.tabBar.backgroundColor = [UIColor blackColor];
    //3.设置按钮
    NSArray *imgName = @[@"news_tabBar",@"find_tabBar"];
    CGFloat width = self.view.bounds.size.width / 2;
    for (int i = 0; i < imgName.count ; i ++) {
        UIButton * tabBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBtn.frame = CGRectMake(width * i  , 0, width, 49);
        [tabBtn setImage:[UIImage imageNamed:imgName[i]] forState:UIControlStateNormal];
        tabBtn.tag = i;
        [tabBtn addTarget:self action:@selector(selecController:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:tabBtn];
    }
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake((self.view.bounds.size.width - 49)/2, 0, 49, 49);
    [addBtn setImage:[UIImage imageNamed:@"add_nomal_tabBar"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"add_select_tabBar.png"] forState:UIControlStateSelected];
    [addBtn addTarget:self action:@selector(addShadeView:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:addBtn];
}
- (void)selecController:(UIButton *)button {
    self.selectedIndex = button.tag;
}
- (void)addShadeView:(UIButton *)add {
    add.selected = !add.selected;
    
    if (add.selected == YES) {
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
