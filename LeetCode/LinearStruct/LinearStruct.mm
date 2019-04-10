//
//  LinearStruct.m
//  LeetCode
//
//  Created by wei zhang on 2019/4/9.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "LinearStruct.h"

@implementation LinearStruct

void twoSum(int nums[], int len, int *i,int *j, int target) {
    *i = 0;
    *j = 0;
    NSMutableDictionary *dict_M = [NSMutableDictionary dictionaryWithCapacity:0];
    while (*i < len) {
        if ([dict_M.allKeys containsObject:@(target - nums[*i])]) {
            *j = [dict_M[@(target - nums[*i])] intValue];
            break;
        }
        else {
            dict_M[@(target - nums[*i])] = @(*i);
        }
        (*i)++;
    }
}

@end
