//
//  SlipWindow.h
//  LeetCode
//
//  Created by wei zhang on 2019/4/13.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlipWindow : NSObject
+ (NSArray *)slidingWindow2:(NSArray *)source k:(NSInteger)k;
+ (NSArray *)slidingWindow:(NSArray *)source k:(NSInteger)k;
@end

NS_ASSUME_NONNULL_END
