//
//  SearchSpace.m
//  WaterVolume
//
//  Created by JiaLi on 16/4/20.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "SearchSpace.h"

@interface SearchSpace()
@property (nonatomic, strong, readonly) NSMutableArray* direction;
@property (nonatomic, strong, readonly) NSMutableArray* visit;
@property (nonatomic, strong, readonly) NSArray* stepx; // move in map, step x
@property (nonatomic, strong, readonly) NSArray* stepy; // move in map, step y
@property (nonatomic, strong, readonly) NSMutableArray* stack;
@property (nonatomic) int stackTop;
@property (nonatomic) int mapWidth;
@end

@implementation SearchSpace
- (void)initMap:(NSMutableArray*)map {
    _map = map;
}

- (id)init {
    self = [super init];
    _stepx = @[@(-1), @(-1), @(0), @(0)];
    _stepy = @[@(0), @(0), @(-1), @(-1)];
   return self;
}

- (id)initWithMap:(NSArray*)m withWidth:(int)width withDepth:(int)depth{
    self = [super init];
    _stepx = @[@(-1), @(-1), @(0), @(0)];
    _stepy = @[@(0), @(0), @(-1), @(-1)];
    _map = m;
    _stack = [[NSMutableArray alloc] initWithCapacity:(width*depth)];
    _visit = [[NSMutableArray alloc] init];
    _mapWidth = width;
    for (int i = 0; i < depth; i++) {
        NSMutableArray* rowArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < width; j++) {
            [rowArray addObject:@(0)];
        }
        [_visit addObject:rowArray];
    }
    return self;
}

- (void)print_stack:(int)top {
    if(top <= 0){
        printf("......起点和终点是一样的\n");
        return ;
    }
    int flag = 0;
    while(top > 0){
        int u = [_stack[--top] intValue];
        int x = u / _mapWidth;
        int y = u % _mapWidth;
        printf(flag++? "->(%d,%d)":"(%d,%d)",x,y,x,y);
    }
}

- (void)deepFirstSearchStart:(int)start_x starty:(int)start_y endx:(int)end_x endy:(int)end_y {
    //(satrt_x,start_y)表示始点，(end_x,end_y)表示终点同时也表示出发点
    if(start_x == end_x && start_y == end_y){
        [self print_stack:_stackTop];
        return ;
    }
    _stack[_stackTop++]  = @(end_x * _mapWidth + end_y);
    int _top = _stackTop;
   
    _visit[end_x][end_y] = @(1);//把本结点标志为已经访问。
    for(int i = 0;i < 4; ++i){
        int nx = end_x + [_stepx[i] intValue];
        int ny = end_y + [_stepy[i] intValue];
        if([self isWall:nx withY:ny] && ![_visit[nx][ny] intValue]){
            [self deepFirstSearchStart:start_x starty:start_y endx:nx endy:ny];
            _stackTop = _top;
        }
    }
    _visit[end_x][end_y] = @(0);//(end_x,end_y)点四个方向的点都遍历了一次之后，重新将该点置为未访问。
}

- (BOOL)isWall:(int)posx withY:(int)posy {
    if (_map == nil || posx >= _map.count) {
        return NO;
    }
    
    NSArray* heightRow = _map[posx];
    if (posy > heightRow.count) {
        return NO;
    }
    
    int height = [heightRow[posy] intValue];
    int left = posy > 0 ? (posy - 1) : -1;
    
    int heightOfleft = -1;
    if (left > 0) {
        heightOfleft = [heightRow[left] intValue];
    }
    
    int right = posy < heightRow.count - 1 ? (posy + 1) : -1;
    int heightOfRight = -1;
    if (right > 0) {
        heightOfRight = [heightRow[right] intValue];
    }
    
    int up = posx > 0 ? (posx - 1) : -1;
    int heightOfUp = -1;
    if (up > 0) {
         heightOfUp = [_map[up][posy] intValue];
    }
    
    int down = posx < _map.count - 1 ? (posx + 1) : -1;;
    int heightOfDown = -1;
    if (down > 0) {
         heightOfDown =  [_map[down][posy] intValue];
    }
    
    return ((height >= heightOfleft) && (height >= heightOfRight) && (height >= heightOfUp) && (height >= heightOfDown));
}

@end
