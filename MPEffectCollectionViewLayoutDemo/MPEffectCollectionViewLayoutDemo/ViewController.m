//
//  ViewController.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/9.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "ViewController.h"
#import "MPEffectCollectionViewFlowLayout.h"
#import "MPEffectCollectionViewCell.h"
#import "MPEffectCollectionHeaderView.h"
#import "MPEffectCollectionView.h"
#import "MPEffect.h"
#import "MPEffectGroup.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MPEffectCollectionHeaderViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MPEffectCollectionViewFlowLayout *layout = [[MPEffectCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(40, 60);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.headerReferenceSize = CGSizeMake(40, 60);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    _collectionView = [[MPEffectCollectionView alloc] initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, 60) collectionViewLayout:layout];
    [_collectionView setCollectionViewLayout:layout animated:YES];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[MPEffectCollectionViewCell class] forCellWithReuseIdentifier:@"MPEffectCollectionViewCell"];
    [_collectionView registerClass:[MPEffectCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MPEffectCollectionHeaderView"];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor greenColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
}


#pragma mark - Private

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        int arr[7] = {4,3,5,4,7,2,5};
        for (int i =0; i<7; ++i) {
            NSMutableArray *effects = [NSMutableArray array];
            for (int j =0; j<arr[i]; j++) {
                MPEffect *effect = [[MPEffect alloc] initWithImgUtl:nil
                                                     withEffectName:[NSString stringWithFormat:@"test%d-%d",i,j]];
                [effects addObject:effect];
            }
            MPEffectGroup *group = [[MPEffectGroup alloc] initGroupName:[NSString stringWithFormat:@"test%d",i]
                                                        withEffectArray:effects];
            [_dataArr addObject:group];
        }
    }
    return _dataArr;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    MPEffectGroup *group = _dataArr[section];
    return group.itemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MPEffectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MPEffectCollectionViewCell" forIndexPath:indexPath];
    MPEffectGroup *group = _dataArr[indexPath.section];
    MPEffect *effect = group.effectArray[indexPath.row];
    cell.name.text = effect.effectName;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MPEffectCollectionHeaderView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MPEffectCollectionHeaderView" forIndexPath:indexPath];
        headerView.delegate = self;
        MPEffectGroup *group = _dataArr[indexPath.section];
        headerView.name.text = group.groupName;
        headerView.headViewBtn.tag = indexPath.section;
        return headerView;
    }
    return nil;

}
#pragma mark - UICollectionViewDelegate


#pragma mark - MPEffectCollectionHeaderViewDelegate
-(void)MPEffectCollectionHeaderViewClick:(UIButton *)btn {
    MPEffectGroup *group = _dataArr[btn.tag];
    if (group.opened) {
        group.opened = NO;
        NSMutableArray *indexPathArray = [NSMutableArray array];
        for (NSInteger i = group.effectArray.count; i > 0; --i) {
            [indexPathArray addObject:[NSIndexPath indexPathForItem:i-1 inSection:btn.tag]];
        }
         group.itemCount = 0;
        [_collectionView deleteItemsAtIndexPaths:indexPathArray];
        
    } else {
        group.opened = YES;
        NSMutableArray *indexPathArray = [NSMutableArray array];
        for (int i = 0; i < group.effectArray.count; ++i) {
            [indexPathArray addObject:[NSIndexPath indexPathForItem:i inSection:btn.tag]];
        }
        group.itemCount = group.effectArray.count;
        [_collectionView insertItemsAtIndexPaths:indexPathArray];
    }
  

    
}
@end
