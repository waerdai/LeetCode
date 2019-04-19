//
//  ViewController.m
//  LeetCode
//
//  Created by wei zhang on 2019/4/9.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ViewController.h"
#import "ValidParentheses/ValidParentheses.h"
#import "SlipWindow/SlipWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addMux];
}

- (void)addMux {
    /// 同步锁 并发异步 嵌套加锁 造成死锁
    ///[self addSync];
    /// NSLock 
    ///[self addNSLock];
}

- (void)addNSLock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLock *m_lock = [[NSLock alloc] init];
        [m_lock lock]; // 成功上锁
        NSLog(@"something1");
        [m_lock lock]; // 上面已经上锁，这里阻塞等待锁释放，不会再执行下面，锁永远得不到释放，即死锁
        NSLog(@"something2");
        [m_lock unlock]; // 不会执行到
        NSLog(@"something3");
        [m_lock unlock];
    });
}

- (void)addSync {
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    
    static NSString *a = @"aaa";
    static NSString *b = @"bbb";
    dispatch_async(queue, ^{
        @synchronized (a) {
            NSLog(@"1--1111");
            @synchronized (b) {
                NSLog(@"1--2222");
            }
        }
    });
    dispatch_async(queue, ^{
        @synchronized (b) {
            NSLog(@"2--1111");
            @synchronized (a) {
                NSLog(@"2--2222");
            }
        }
    });
}

- (void)testSlipWindow {
    NSArray *results = [SlipWindow slidingWindow2:@[@(1),@(3),@(-1),@(-3),@(5),@(3),@(6)] k:3];
    NSLog(@"results:%@", results);
}

- (void)testArray {
    NSMutableArray *array_m = [@[@"1",@"2",@"3",@"4",@"5"] mutableCopy];
    ///'*** Collection <__NSArrayM: 0x600002cbbae0> was mutated while being enumerated.'
    for (NSString *str in array_m) {
        if ([str isEqualToString:@"3"]) {
            [array_m removeObject:str];//会崩
        }
        NSLog(@"array:%@", array_m);
    }
}

- (void)testValidParentheses {
    NSString *ss = @"[({})]";
    if ([ValidParentheses isValidParentheses:ss]) {
        NSLog(@"合法");
    }
    else {
        NSLog(@"不合法");
    }
}

@end
