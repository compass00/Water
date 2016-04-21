//
//  WaterVolume.h
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brick.h"

@interface WaterVolume : NSObject

- (int)water_volume:(NSArray*)height withWidth:(int)width withDepth:(int)depth;

- (NSMutableArray*)buildRoom;
- (BOOL)deepSearchRoomfrom:(int)posx withY:(int)poxy;
- (WVType)getBrickType:(int)posx withY:(int)poxy;
- (BOOL)isNeighbor:(int)fromposx andY:(int)fromposy withX:(int)posx withY:(int)poxy;
@end
