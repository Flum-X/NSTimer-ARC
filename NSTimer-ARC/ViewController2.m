//
//  ViewController2.m
//  NSTimer-ARC
//
//  Created by DaXiong on 17/5/4.
//  Copyright © 2017年 DaXiong. All rights reserved.
//  三种解决timer循环引用的方法

#import "ViewController2.h"
#import "DXTimer.h"
#import "NSTimer+Block.h"

//定义了一个__weak的self_weak_变量
#define weakifySelf  \
__weak __typeof(&*self)weakSelf = self

//局域定义了一个__strong的self指针指向self_weak
#define strongifySelf \
__strong __typeof(&*weakSelf)self = weakSelf


@interface ViewController2 ()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) DXTimer *myTimer;
@property (nonatomic,strong) NSTimer *blockTimer;
@end

@implementation ViewController2
/**
 *引入中间类时，只需要在delloc方法中调用中间类的释放定时器的方法
 */
- (void)dealloc
{
    [_myTimer cleanTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"定时器";
    self.view.backgroundColor = [UIColor redColor];
    
//    [self testTimer];
    
    [self testMyTimer];
    
//    [self testBlockTimer];
}

/**
 *block方式创建timer
 */
- (void)testBlockTimer
{
    weakifySelf;
    _blockTimer = [NSTimer dx_scheduledTimerWithTimeInterval:1 repeats:YES block:^{
        strongifySelf;
        [self timeOut];
    }];
}

/**
 *通过中间类间接创建timer
 */
- (void)testMyTimer
{
    _myTimer = [[DXTimer alloc] init];
}

/**
 *正常创建一个timer
 */
- (void)testTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeOut) userInfo:nil repeats:YES];
    
//    [_timer fire];
}

- (void)timeOut
{
    NSLog(@"定时器还在...");
}

/**
 *在视图控制器视图消失的方法中释放定时器,
 *但是如果还有下一级新的控制器，则每次进入这个页面时都要重新添加定时器
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
