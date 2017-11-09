//
//  Stack.h
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 栈的实现
 */
@interface Stack : NSObject

//栈内总数
- (NSUInteger)count;

//进栈
- (void)push:(id)element;

//出栈
- (void)pop;

//顶部数据
- (id)top;

//是否为空
- (BOOL)isEmpty;


@end
