//
//  Tree.h
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

//当前节点值
@property (nonatomic, strong) id value;

//父节点
@property (nonatomic, weak) Tree *parent;

//子节点
@property (nonatomic, strong) NSMutableArray<Tree *> *childrens;

//初始化
- (instancetype)init:(id)value;

//添加子节点
- (void)addChild:(Tree *)child;

@end
