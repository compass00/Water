//
//  Room.h
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brick.h"

@interface Room : NSObject
@property(nonatomic, strong, readonly) NSMutableArray* brickArray;

- (void)addBrick:(Brick*)brick;

- (int)calculateRoomVolume;

@end
