//
//  MergeArray.h
//  algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/*
 合并排序，将两个已经排序的数组合并成一个数组，其中一个数组能容下两个数组的所有元素;
 合并排序一般的思路都是创建一个更大数组C，刚好容纳两个数组的元素，先是一个while循环比较，将其中一个数组A比较完成，将另一个数组B中所有的小于前一个数组A的数及A中所有的数按顺序存入C中，再将A中剩下的数存入C中，但这里是已经有一个数组能存下两个数组的全部元素，就不用在创建数组了，但只能从后往前面存，从前往后存，要移动元素很麻烦。
 */

#import <Foundation/Foundation.h>

@interface MergeArray : NSObject

- (NSMutableArray *)mergeArrayWithFirstArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray;

@end
