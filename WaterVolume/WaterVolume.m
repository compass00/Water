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
#import "SearchSpace.h"
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
    
    
  
    // 2. search all walls
    //NSMutableArray* walls = [self searchAllWalls];
    SearchSpace* search = [[SearchSpace alloc] initWithMap:height withWidth:width withDepth:depth];
    // 3. search the close space
    [search deepFirstSearchStart:0 starty:0 endx:1 endy:0];
    
    
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
@end
