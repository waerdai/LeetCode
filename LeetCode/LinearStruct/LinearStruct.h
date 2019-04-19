//
//  LinearStruct.h
//  LeetCode
//
//  Created by wei zhang on 2019/4/9.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinearStruct : NSObject

/// 题1 数组中找出两个数的下标i，j使a[i]+a[j]和为target
void twoSum(int nums[], int len, int *i,int *j, int target);

@end

NS_ASSUME_NONNULL_END
