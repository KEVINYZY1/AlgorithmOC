//
//  Queue.m
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "Queue.h"

@interface Queue()
@property (nonatomic, strong) NSMutableArray *queueArray;
@end

@implementation Queue

- (BOOL)isEmpty {
    return self.queueArray.count == 0 ? YES : NO;
}

- (NSUInteger)count {
    return self.queueArray.count;
}

- (void)enqueue:(id)obj {
    [self.queueArray addObject:obj];
}

- (id)dequeue {
    if (self.queueArray.count == 0) {
        return nil;
    } else {
        //取值，移除，返回
        id returnValue = self.queueArray[0];
        [self.queueArray removeObjectAtIndex:0];
        return returnValue;
    }
}

- (id)front {
    if (self.queueArray.count != 0) {
        return self.queueArray[0];
    }
    return nil;
}

- (NSMutableArray *)queueArray {
    if (_queueArray == nil) {
        _queueArray = [[NSMutableArray alloc] init];
    }
    return _queueArray;
}

@end
