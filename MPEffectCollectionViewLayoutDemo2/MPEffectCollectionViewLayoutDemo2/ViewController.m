//
//  ViewController.m
//  MPEffectCollectionViewLayoutDemo2
//
//  Created by meitu on 2017/6/12.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "ViewController.h"
#import "MPIEffectCollectionViewFlowLayout.h"
#import "MPEffectCollectionViewCell.h"
#import "MPEffectCollectionView.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) MPEffectCollectionView *collectionView;
@property (nonatomic, strong) MPIEffectCollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 300,60, 60)];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _layout = [[MPIEffectCollectionViewFlowLayout alloc] init];
    _layout.itemSize = CGSizeMake(40, 60);
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    _layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    _collectionView = [[MPEffectCollectionView alloc] initWithFrame:CGRectMake(60, 300, self.view.bounds.size.width-60, 60) collectionViewLayout:_layout];
    [_collectionView setCollectionViewLayout:_layout animated:YES];
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[MPEffectCollectionViewCell class] forCellWithReuseIdentifier:@"MPEffectCollectionViewCell"];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor greenColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //[NSTimer scheduledTimerWithTimeInterval:0.7 target: self selector:@selector(btnClick:) userInfo:nil repeats:YES];
    
}

- (void)btnClick:(UIButton *)btn {
    //[_collectionView setContentOffset:CGPointMake(-100, 0) animated:YES];

    _layout.isOpen = !_layout.isOpen;
}

#pragma mark - Private

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        for (int i =0; i<37; ++i) {
           [_dataArr addObject:[NSString stringWithFormat:@"test-%d",i]];
        }
    }
    return _dataArr;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MPEffectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MPEffectCollectionViewCell" forIndexPath:indexPath];
    cell.name.text = _dataArr[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
