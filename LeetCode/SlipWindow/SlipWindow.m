//
//  SlipWindow.m
//  LeetCode
//
//  Created by wei zhang on 2019/4/13.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "SlipWindow.h"

@implementation SlipWindow

/// 用双端队列 时间复杂度n
+ (NSArray *)slidingWindow2:(NSArray *)source k:(NSInteger)k {
    NSMutableArray *array_m = [NSMutableArray arrayWithCapacity:0];//装k个元素
    NSMutableArray *result_m = [NSMutableArray arrayWithCapacity:0];//装结果集
    
    [source enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([array_m count] > 0) {
            NSNumber *obj1 = [array_m firstObject];
            if ([obj integerValue] > [obj1 integerValue]) {
                [array_m replaceObjectAtIndex:0 withObject:obj];
            }
        }
        else {
            [array_m addObject:obj];
        }
        
        if (idx >= (k - 1)) {
            [result_m addObject:[array_m firstObject]];
        }
    }];
    
    return [result_m copy];
}

/// 时间复杂度 n*logk
+ (NSArray *)slidingWindow:(NSArray *)source k:(NSInteger)k {
    NSMutableArray *array_m = [NSMutableArray arrayWithCapacity:0];//装k个元素
    NSMutableArray *result_m = [NSMutableArray arrayWithCapacity:0];//装结果集
    [source enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array_m addObject:obj];
        
        if ([array_m count] == k) {
            [array_m sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [obj2 compare:obj1];
            }];
            [result_m addObject:[array_m firstObject]];
            [array_m removeLastObject];
        }
        
    }];
    return [result_m copy];
}

@end
