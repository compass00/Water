//
//  ViewController.m
//  WaterVolume
//
//  Created by JiaLi on 16/4/13.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "ViewController.h"

#import "WaterVolume.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray* mapHeightArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WaterVolume* w = [[WaterVolume alloc] init];
    //int height_example = {{5, 5, 5, 5}, {5, 1, 5, 5},{5, 5, 5, 5}};
    NSArray* level0 = @[@(5), @(5), @(5), @(5), @(5)];
    NSArray* level1 = [NSArray arrayWithObjects:@(5), @(1), @(5), @(3), @(5),nil];
    NSArray* level2 = [NSArray arrayWithObjects:@(5), @(2), @(5), @(2), @(5),nil];
    NSArray* level3 = [NSArray arrayWithObjects:@(5), @(5), @(5), @(5), @(5),nil];
    _mapHeightArray =  [NSArray arrayWithObjects:level0, level1, level2, level3, nil];
    dispatch_async(dispatch_queue_create("watervolume", DISPATCH_QUEUE_CONCURRENT), ^() {
        int volume = [w water_volume:_mapHeightArray withWidth:4 withDepth:3];
        self.labelVolume.text = [NSString stringWithFormat:@"%d", volume];
        
    });
    //self.labelHeightMap.text = @height_example;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
