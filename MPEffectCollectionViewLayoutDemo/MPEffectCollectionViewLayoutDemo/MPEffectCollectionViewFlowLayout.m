//
//  MPEffectCollectionViewFlowLayout.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/9.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "MPEffectCollectionViewFlowLayout.h"
#import "MPEffectCollectionView.h"

@interface MPEffectCollectionViewFlowLayout ()

@property (nonatomic, strong) NSMutableArray *insertIndexPaths;
@property (nonatomic, strong) NSMutableArray *deleteIndexPaths;

@end

@implementation MPEffectCollectionViewFlowLayout

//- (void)invalidateLayout {
//
//}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    MPEffectCollectionView *collectionView = self.collectionView;
    if (collectionView.isOpen) {
        NSArray *arr = [super layoutAttributesForElementsInRect:rect];
        for (UICollectionViewLayoutAttributes *attr in arr) {
            attr.center = CGPointMake(0, 0);
        }
        return arr;
    }
    return [super layoutAttributesForElementsInRect:rect];
}

- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems{
    [super prepareForCollectionViewUpdates:updateItems];
    
    _insertIndexPaths = [NSMutableArray array];
    _deleteIndexPaths = [NSMutableArray array];
    
    for (UICollectionViewUpdateItem *updateItem in updateItems) {
        if (updateItem.updateAction == UICollectionUpdateActionInsert) {
            [_insertIndexPaths addObject:updateItem.indexPathAfterUpdate];
        }
        else if(updateItem.updateAction == UICollectionUpdateActionDelete) {
            [_deleteIndexPaths addObject:updateItem.indexPathBeforeUpdate];
        }
    }
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    
    UICollectionViewLayoutAttributes *attr = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    if ([_insertIndexPaths containsObject:itemIndexPath]) {
        if (!attr) {
            attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];;
        }
        UICollectionViewLayoutAttributes *headAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:itemIndexPath];
         attr.center = headAttr.center;
        
    }
    return attr;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes *attr = [super finalLayoutAttributesForDisappearingItemAtIndexPath: itemIndexPath];
    if ([_deleteIndexPaths containsObject:itemIndexPath]) {
        if (!attr) {
            attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];;
        }
        UICollectionViewLayoutAttributes *headAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:itemIndexPath];
         attr.center = headAttr.center;
    }
    return attr;
}

@end
