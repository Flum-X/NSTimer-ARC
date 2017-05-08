//
//  NSTimer+Block.m
//  NSTimer-ARC
//
//  Created by DaXiong on 17/5/8.
//  Copyright © 2017年 DaXiong. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)
+ (NSTimer *)dx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void (^)())block
{
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(dx_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)dx_blockInvoke:(NSTimer *)timer
{
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
