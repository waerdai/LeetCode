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

    [self testSlipWindow];
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
