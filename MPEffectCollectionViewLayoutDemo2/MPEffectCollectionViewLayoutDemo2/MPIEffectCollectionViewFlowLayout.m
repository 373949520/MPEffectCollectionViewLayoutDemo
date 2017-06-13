//
//  MPEffectCollectionViewFlowLayout.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/9.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "MPIEffectCollectionViewFlowLayout.h"

@interface MPIEffectCollectionViewFlowLayout ()

@end

@implementation MPIEffectCollectionViewFlowLayout

#pragma mark Override

- (instancetype)init{
    if (self = [super init]) {
        _isOpen = true;
    }
    return self;
}

- (void)setIsOpen:(BOOL)isOpen {
    if (_isOpen != isOpen) {
        _isOpen = isOpen;
        [self.collectionView performBatchUpdates:^{
            [self.collectionView reloadData];
        } completion:^(BOOL finished) {}];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    self.cellOffsetCenter = CGPointMake(-self.itemSize.width, self.collectionView.frame.size.height / 2.0);
    if (!_isOpen) {
        NSArray *arr = [super layoutAttributesForElementsInRect:rect];
        for (UICollectionViewLayoutAttributes *attr in arr) {
            attr.center = _cellOffsetCenter;
        }
        NSLog(@"目的地：%f",self.cellOffsetCenter.x);
        return arr;
    }
    return [super layoutAttributesForElementsInRect:rect];
}

- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems {
    [super prepareForCollectionViewUpdates:updateItems];
    for (UICollectionViewUpdateItem * item in updateItems) {
        if (item.updateAction == UICollectionUpdateActionMove) {
            
        }
    }
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attr = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    if (!attr) {
        attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    }
    NSLog(@"出发地：%f",self.cellOffsetCenter.x);
    if (_isOpen == NO) {
        attr.center = self.cellOffsetCenter;
    }

    return attr;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attr = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    return attr;
}


- (void)finalizeCollectionViewUpdates {
    if (_isOpen == false && fabs(self.collectionView.contentOffset.x) > 0.00001f) {
        [self.collectionView setContentOffset:CGPointZero];
    }
}

@end
