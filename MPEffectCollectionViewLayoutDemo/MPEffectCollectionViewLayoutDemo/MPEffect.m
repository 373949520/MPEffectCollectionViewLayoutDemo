//
//  MPEffect.m
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import "MPEffect.h"

@implementation MPEffect

- (instancetype)init {
    return [self initWithImgUtl:nil withEffectName:nil];
}

- (instancetype)initWithImgUtl:(NSString *) imgUrl withEffectName:(NSString *) effectName {
    if (self = [super init]) {
        _imgUrl = imgUrl;
        _effectName = effectName;
    }
    return self;
}
@end
