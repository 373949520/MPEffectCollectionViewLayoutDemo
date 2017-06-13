//
//  MPEffectCollectionViewCell.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "MPEffectCollectionViewCell.h"

@interface MPEffectCollectionViewCell ()

@end


@implementation MPEffectCollectionViewCell

- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _imgView = [[UIImageView alloc] init];
    _name = [[UILabel alloc] init];
    [self addSubview:_imgView];
    [self addSubview:_name];
}


- (void)layoutSubviews{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    _imgView.frame = CGRectMake(0, 0, 40,40 );
    _imgView.layer.cornerRadius = 20;
    _imgView.backgroundColor = [UIColor grayColor];
    
    _name.frame = CGRectMake(0, height/5*4, width, height/5);
    _name.textAlignment = NSTextAlignmentCenter;
    _name.font = [UIFont systemFontOfSize:10];
    _name.backgroundColor = [UIColor redColor];
}

@end
