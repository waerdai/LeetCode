//
//  ValidParentheses.m
//  LeetCode
//
//  Created by wei zhang on 2019/4/10.
//  Copyright © 2019 wei zhang. All rights reserved.
//

#import "ValidParentheses.h"

@implementation ValidParentheses
/// 判断 括号字符串是否有效
/***
 左括号，入栈，如果右括号 则判断 栈顶是否为右括号
 并出栈，最后栈为空 则合法 否则不合法
 */
+ (BOOL)isValidParentheses:(NSString *)string {
    NSMutableArray *stack = [NSMutableArray arrayWithCapacity:0];
    NSDictionary *parenMap = @{@")":@"(",@"]":@"[",@"}":@"{"};
    NSString *temp = nil;
    for(int i = 0; i < [string length]; i++)
    {
        temp = [string substringWithRange:NSMakeRange(i, 1)];
        if ([[parenMap allValues] containsObject:temp]) {
            /// 如果是 左括号，入栈
            [stack addObject:temp];
        }
        else if ([[stack lastObject] isEqualToString:parenMap[temp]]) {
            /// 如果是 右括号，则看 栈顶元素是不是对应的左括号，是则出栈
            [stack removeLastObject];
        }
        else {
            /// 如果 是右括号 且 没有对应的 左括号,则直接返回 false
            return false;
        }
    }
    
    if ([stack count] == 0) {
        return true;
    }
    
    return false;
}
@end
