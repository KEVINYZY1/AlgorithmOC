//
//  Tree.m
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "Tree.h"

@implementation Tree

- (instancetype)init:(id)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}

- (void)addChild:(Tree *)child {
    [self.childrens addObject:child];
    child.parent = self;
}

- (NSMutableArray<Tree *> *)childrens {
    if (_childrens == nil) {
        _childrens = [[NSMutableArray alloc] init];
    }
    return _childrens;
}

- (NSString *)description {
    NSMutableString *meDes = [[NSMutableString alloc] initWithString:self.value];
    
    if (self.childrens != nil) {
        for (int i = 0; i < self.childrens.count; i++) {
            [meDes appendString:@"{"];
            [meDes appendString:[self.childrens[i] description]];
            [meDes appendString:@"}"];
        }
    }
    
    return meDes;
    
    /*
    if (self.parent == nil) {
        return @"当前为根节点";
    }
    return [NSString stringWithFormat:@"当前节点值:%@\n子节点值%@\n父节点值%@", self.value, self.childrens, self.parent];
     */
}

@end
