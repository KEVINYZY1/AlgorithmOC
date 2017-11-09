//
//  MergeArray.m
//  algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "MergeArray.h"

@implementation MergeArray

- (NSMutableArray *)mergeArrayWithFirstArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray {
    
    //逐个比较插入
    NSMutableArray *useArray = [[NSMutableArray alloc] initWithArray:firstArray];
    
    for (int i = 0; i < secondArray.count; i++) {
        for (int j = 0; j < useArray.count; j++) {
            //在首部
            if (j == 0) {
                if (secondArray[i] < useArray[j]) {
                    [useArray insertObject:secondArray[i] atIndex:0];
                }
            }
            //在尾部
            if (j == useArray.count - 1) {
                if (secondArray[i] > useArray[j]) {
                    [useArray insertObject:secondArray[i] atIndex:useArray.count];
                }
            }
            //排除首尾
            if (secondArray[i] > useArray[j] && secondArray[i] < useArray[j + 1]) {
                [useArray insertObject:secondArray[i] atIndex:j];
            }
        }
    }
    
    return useArray;
}

@end
