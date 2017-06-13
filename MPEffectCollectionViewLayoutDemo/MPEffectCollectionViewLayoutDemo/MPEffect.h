//
//  MPEffect.h
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPEffect : NSObject

@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, copy) NSString *effectName;

- (instancetype)init;
- (instancetype)initWithImgUtl:(NSString *) imgUrl withEffectName:(NSString *) effectName;
@end
