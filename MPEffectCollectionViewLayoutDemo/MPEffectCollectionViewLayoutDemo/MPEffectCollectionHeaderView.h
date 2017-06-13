//
//  MPEffectCollectionHeaderView.h
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MPEffectCollectionHeaderViewDelegate;


@interface MPEffectCollectionHeaderView : UICollectionReusableView

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIButton *headViewBtn;
@property (nonatomic, weak) id<MPEffectCollectionHeaderViewDelegate> delegate;

@end

@protocol MPEffectCollectionHeaderViewDelegate <NSObject>

- (void)MPEffectCollectionHeaderViewClick:(UIButton *)btn;

@end
