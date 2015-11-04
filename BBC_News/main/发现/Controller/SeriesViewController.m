//
//  SeriesViewController.m
//  BBC_News
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "SeriesViewController.h"
@interface SeriesViewController ()
{
    UICollectionView *_collectionView;
}

@end

@implementation SeriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"听说系列应用";
    [self createcollectionView];
    
   
    
    
}
#pragma mark - 创建collectionView
- (void)createcollectionView {
    // 创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(110, 110);
    layout.minimumInteritemSpacing = 10;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    // 注册单元格
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"seriesCell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"seriesCell" forIndexPath:indexPath];
    NSArray *seriesPic = @[@"special_velocity.png",
                            @"six_minutes.png",
                            @"English_video.png",
                            @"constant_velocity.png",
                            @"workplace_Engliish.png",
                            @"show_English.png",
                            @"word_story.png",
                            @"BBC_English.png"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(18.5, 3.5, 73, 73)];
    imgView.backgroundColor = [UIColor blackColor];
    imgView.layer.cornerRadius = 5;
    imgView.image = [UIImage imageNamed:seriesPic[indexPath.row]];
    imgView.clipsToBounds = YES;
    [cell.contentView addSubview:imgView];
    
    
    NSArray *seriesName = @[@"VOA慢速英语",
                            @"六分钟英语",
                            @"VOA英语视频",
                            @"VOA常速英语",
                            @"BBC职场英语",
                            @"美语怎么说",
                            @"VOA单词故事",
                            @"BBC新闻"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, cell.bounds.size.width, 17)];
    label.text = seriesName[indexPath.row];
    label.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:label];;
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

//单元格高度和宽度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        return CGSizeMake(110,110);
}

@end
