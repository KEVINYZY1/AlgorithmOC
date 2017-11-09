//
//  Stack.m
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "Stack.h"

@interface Stack()
@property (nonatomic, strong) NSMutableArray *stackArray;
@end

@implementation Stack

- (void)pop {
    [self.stackArray removeLastObject];
}

- (void)push:(id)element {
    [self.stackArray addObject:element];
}

- (id)top {
    if (self.stackArray.count != 0) {
        return [self.stackArray lastObject];
    }
    return nil;
}

- (NSUInteger)count {
    return self.stackArray.count;
}

- (BOOL)isEmpty {
    return self.stackArray.count == 0 ? YES : NO;
}

//懒加载:
- (NSMutableArray *)stackArray {
    if (_stackArray == nil) {
        _stackArray = [[NSMutableArray alloc] init];
    }
    return _stackArray;
}

@end
