//
//  MPEffectGroup.h
//  MPEffectCollectionViewLayoutDemo
//
//  Created by meitu on 2017/6/11.
//  Copyright © 2017年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPEffectGroup : NSObject

@property (nonatomic, strong) NSMutableArray *effectArray;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, assign) BOOL opened;
@property (nonatomic, assign) int itemCount;
- (instancetype)init;
- (instancetype)initGroupName:(NSString *)groupName withEffectArray:(NSMutableArray *)effectArray;
@end
