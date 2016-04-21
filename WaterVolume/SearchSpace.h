//
//  SearchSpace.h
//  WaterVolume
//
//  Created by JiaLi on 16/4/20.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchSpace : NSObject
@property (nonatomic, strong, readonly) NSArray* map;

- (id)initWithMap:(NSArray*)m withWidth:(int)width withDepth:(int)depth;
- (void)deepFirstSearchStart:(int)start_x starty:(int)start_y endx:(int)end_x endy:(int)end_y;

@end
