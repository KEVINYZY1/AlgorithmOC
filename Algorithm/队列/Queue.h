//
//  Queue.h
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

//是否为空
- (BOOL)isEmpty;

//数量
- (NSUInteger)count;

//入队
- (void)enqueue:(id)obj;

//出队
- (id)dequeue;

//队首
- (id)front;

@end
