//
//  ViewController.m
//  LeetCode
//
//  Created by wei zhang on 2019/4/9.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ViewController.h"
#import "ValidParentheses/ValidParentheses.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
