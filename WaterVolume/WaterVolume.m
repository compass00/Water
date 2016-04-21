//
//  WaterVolume.m
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "WaterVolume.h"
#import "Room.h"
#import "Wall.h"
#import "DeepSearch.h"
@interface WaterVolume()
@property (nonatomic, strong) NSArray* mapHeightArray;
@property (nonatomic) int mapWidth;
@property (nonatomic) int mapDepth;

@end

@implementation WaterVolume

- (int)water_volume:(NSArray*)height withWidth:(int)width withDepth:(int)depth {

    // 1. initilize
    _mapHeightArray = height;
    _mapWidth = width;
    _mapDepth = depth;
    
    
   /* for (int i = 0; i <_mapDepth; i++) {
        for (int j = 0; j < _mapWidth; j++) {
            [_dirArray addObject:@(0)];
            [_visitArray addObject:@(0)];
            
        }
    }*/
    DFS(1, 1, 2, 1);
    // 2. search all walls
    NSMutableArray* walls = [self searchAllWalls];
    
    // 3. search the close space
    
    
    // 4. build room
    NSMutableArray* rooms = [self buildRoom];
    int volume = 0;

    // 5. calculate room volume
    if (rooms == nil || rooms.count < 1) {
        return volume;
    }
    for (Room* r in rooms) {
        volume += [r calculateRoomVolume];
    }
    return volume;
}

- (NSMutableArray*)buildRoom {
    if (_mapWidth < 1 || _mapDepth < 1 || _mapHeightArray == nil) {
        return nil;
    }
    
    NSMutableArray* rooms = [[NSMutableArray alloc] init];
    
    for (int i = 1; i < _mapWidth; i++) {
        for (int j = 1; j < _mapDepth; j++) {
            Room* r = [[Room alloc] init];
            if ([self deepSearchRoomfrom:i withY:j toRoom:r]) {
                [rooms addObject:r];
            }
        }
    }
    return rooms;
}

- (NSMutableArray*)searchAllWalls {
    NSMutableArray* walls = [[NSMutableArray alloc] init];
    for (int i = 0; i < _mapHeightArray.count; i++) {
        NSArray* heightrow = [_mapHeightArray objectAtIndex:i];
        if (heightrow.count > 0) {
            for (int j = 0; j < heightrow.count; j++) {
                if ([self isWall:i withY:j]) {
                    int height = [[heightrow objectAtIndex:j] intValue];
                    Wall* w = [[Wall alloc] initWith:height withX:i withY:j];
                   // NSLog (@"x=%d, y=%d, height=%d", i, j, height);
                    [walls addObject:w];
                }
            }
        }
    }
    return walls;
}

- (BOOL)deepSearchRoomfrom:(int)posx withY:(int)posy toRoom:(Room*)room{
    if (_mapHeightArray == nil) {
        return NO;
    }
    int fromx = posx;
    int fromy = posy;
    
    /*const int* heightArray = _mapHeightArray[fromx];
    int height = &heightArray[fromy];
    while (!([self getBrickType:fromx withY:fromy] == WVType_Wall && [self isNeighbor:fromx andY:fromy withX:posx withY:posy])) {
        // to do
    }*/
    
    return YES;

}

- (BOOL)isWall:(int)posx withY:(int)posy {
    if (_mapHeightArray == nil || posx >= _mapHeightArray.count) {
        return NO;
    }
    
    NSArray* heightRow = [_mapHeightArray objectAtIndex:posx];
    if (posy > heightRow.count) {
        return NO;
    }
    
    int height = [[heightRow objectAtIndex:posy] intValue];
    int left = posy > 0 ? (posy - 1) : -1;
    
    int heightOfleft = -1;
    if (left > 0) {
        heightOfleft = [[heightRow objectAtIndex:left] intValue];
    }
    
    int right = posy < heightRow.count - 1 ? (posy + 1) : -1;
    int heightOfRight = -1;
    if (right > 0) {
        heightOfRight = [[heightRow objectAtIndex:right] intValue];
    }
    
    int up = posx > 0 ? (posx - 1) : -1;
    int heightOfUp = -1;
    if (up > 0) {
        NSArray* heightRowUp = [_mapHeightArray objectAtIndex:up];
        heightOfUp = [[heightRowUp objectAtIndex:posy] intValue];
        
    }
    
    int down = posx < _mapHeightArray.count - 1 ? (posx + 1) : -1;;
    int heightOfDown = -1;
    if (down > 0) {
        NSArray* heightRowDown = [_mapHeightArray objectAtIndex:down];
        heightOfDown = [[heightRowDown objectAtIndex:posy] intValue];
    }
    
    /*const int* heightArray = _mapHeightArray[posx];
    int height = &heightArray[posy];
    if (posx == 0 && posy == 0) {
        // first pos
        
    } else {
        
    }*/
    return ((height >= heightOfleft) && (height >= heightOfRight) && (height >= heightOfUp) && (height >= heightOfDown));
}

- (BOOL)isNeighbor:(int)fromposx andY:(int)fromposy withX:(int)posx withY:(int)poxy {
    return (abs(fromposx - posx) == 1 || abs(fromposy - poxy) == 1);
}
@end
