//
//  Brick.h
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, WVType) {
    WVType_None,
    WVType_Brick,
    WVType_Wall,
    WVType_Lowland,
};

@interface Brick : NSObject

- (id) initWith:(int)height withX:(int)x withY:(int)y;

@property (nonatomic, assign) WVType type;
@property (nonatomic, assign) int posx;
@property (nonatomic, assign) int posy;
@property (nonatomic, assign) int height;

@end
