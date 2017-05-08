//
//  DXTimer.m
//  NSTimer-ARC
//
//  Created by DaXiong on 17/5/8.
//  Copyright © 2017年 DaXiong. All rights reserved.
//

#import "DXTimer.h"
@interface DXTimer()
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation DXTimer

- (instancetype)init
{
    if (self = [super init]) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeOut:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)timeOut:(NSTimer *)timer
{
    NSLog(@"定时器还在呀...");
}

- (void)cleanTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)dealloc
{
    NSLog(@"DXTimer实例对象释放了...");
}

@end
