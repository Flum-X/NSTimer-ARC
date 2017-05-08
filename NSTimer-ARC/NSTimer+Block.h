//
//  NSTimer+Block.h
//  NSTimer-ARC
//
//  Created by DaXiong on 17/5/8.
//  Copyright © 2017年 DaXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

+ (NSTimer *)dx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void(^)())block;

@end
