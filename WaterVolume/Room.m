//
//  Room.m
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "Room.h"

@implementation Room

- (void)addBrick:(Brick*)brick {
    if (_brickArray == nil) {
        _brickArray = [[NSMutableArray alloc] init];
    }
    
    if (brick != nil) {
        [_brickArray addObject:brick];
    }
}

- (int)calculateRoomVolume {
    int volume = 0;
    if (_brickArray == nil || [_brickArray count] < 1) {
        return volume;
    }
    Brick* brick = [_brickArray objectAtIndex:0];

    int minHeight = brick.height;
    int sumLowlandHeight = 0;
    
    for (Brick* b in self.brickArray) {
        if (b.type == WVType_Wall) {
            if (b.height < minHeight) {
                minHeight = b.height;
            }
        }
    
    }
    
    for (Brick* b in self.brickArray) {
        if (b.type == WVType_Lowland) {
            sumLowlandHeight +=  b.height > minHeight ? minHeight : b.height;
          }
        
    }
    
    volume = [_brickArray count] * minHeight - sumLowlandHeight;
    
    return volume;
}


@end
