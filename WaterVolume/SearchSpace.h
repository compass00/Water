//
//  SearchSpace.h
//  WaterVolume
//
//  Created by JiaLi on 16/4/20.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchSpace : NSObject
@property (nonatomic, strong, readonly) NSMutableArray* map;
@property (nonatomic, strong, readonly) NSMutableArray* direction;
@property (nonatomic, strong, readonly) NSMutableArray* visit;
@end
