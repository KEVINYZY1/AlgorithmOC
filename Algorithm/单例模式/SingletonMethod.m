//
//  SingletonMethod.m
//  algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "SingletonMethod.h"


//A.1 在该类中定义一个静态的全局变量,防止被外部用extren访问
//B.1 ~~~
//C.1 ~~~
static id _instance;

@implementation SingletonMethod

#pragma mark - 懒汉模式.A

//A.2 重写allocWithZone保证只分配一次内存,alloc方法内部会调用这个方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_instance == nil) {//防止频繁加锁
        @synchronized(self) {//加锁，防止多线程出错而创建多个对象
            if (_instance == nil) {//防止频繁创建
                _instance = [super allocWithZone:zone];
            }
        }
    }
    return _instance;
}

//A.3 提供一个shared方法供外界调用，确保只init一次
+ (instancetype)sharedOnce {
    if (_instance == nil) {
        @synchronized(self) {
            if (_instance == nil) {
                _instance = [[self alloc] init];
            }
        }
    }
    return _instance;
}

//A.4 重写copyWithZone避免使用copy时创建多个对象
- (id)copyWithZone: (NSZone *)zone {
    return _instance;
}

#pragma mark - 饿汉模式.B：当类加入OC运行环境（内存），就会调用1次生成这个单例

//B.2 这里不用加锁，因为程序刚启动，线程还没加载，不会出现线程不安全的问题
+ (instancetype)allocWithZoneB:(struct _NSZone *)zone {
    if (_instance == nil) {
        _instance = [super allocWithZone:zone];
    }
    return _instance;
}

//B.3 提供一个shared方法让外界调用这个单例（一般单例都会提供这个方法）
+ (instancetype)sharedOnceB {
    return _instance;
}

//B.4 重写copyWithZone
- (id)copyWithZoneB:(NSZone *)zone {
    return _instance;
}

//B.5 重写load这个类方法，在里面alloc它.这个方法在程序启动，加载类的时候会调用一次
+ (void)load {
    _instance = [[self alloc] init];
}

#pragma mark -GCD实现单例

//C.2 GCD的dispatch_once重写
+ (instancetype)allocWithZoneC:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

//C.3
+ (instancetype)sharedOnceC {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

//C.4
- (id)copyWithZoneC:(NSZone *)zone {
    return _instance;
}

@end
