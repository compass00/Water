//
//  Brick.m
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "Brick.h"

@implementation Brick

- (id) init {
    self = [super init];
    self.type = WVType_Brick;
    return self;
}

- (id) initWith:(int)height withX:(int)x withY:(int)y {
    self = [super init];
    self.type = WVType_Brick;
    self.height = height;
    self.posx = x;
    self.posy = y;

    return self;
}

@end
