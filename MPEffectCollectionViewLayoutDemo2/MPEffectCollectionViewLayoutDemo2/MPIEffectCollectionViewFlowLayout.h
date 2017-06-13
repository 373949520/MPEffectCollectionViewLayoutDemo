//
//  MPEffectCollectionViewFlowLayout.h
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/9.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPIEffectCollectionViewFlowLayout : UICollectionViewFlowLayout

/**
 这个属性控制cell是否展开，当cell收起时，所有cell的center位置的位置都会被设置为offsetCenter.默认值时ture.
 */
@property (nonatomic, assign) BOOL isOpen;


/**
 cell收起时center的位置，默认值为(-x,y).x大小为CollectionView的offes.x-cell的宽，y大小为CollectionView的高的一半.
 */
@property (nonatomic, assign) CGPoint cellOffsetCenter;

@end
