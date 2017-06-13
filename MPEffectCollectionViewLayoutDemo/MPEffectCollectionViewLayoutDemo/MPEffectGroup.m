//
//  MPEffectGroup.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "MPEffectGroup.h"
#import "MPEffect.h"

@implementation MPEffectGroup

- (instancetype)initGroupName:(NSString *)groupName withEffectArray:(NSMutableArray *)effectArray {
    if (self = [super init]) {
        _groupName = groupName;
        _effectArray = effectArray;
        _opened = NO;
        _itemCount = 0;
    }
    return self;
}

- (instancetype)init {
    return [self initGroupName:nil withEffectArray:nil];
}


@end
