//
//  SingletonMethod.h
//  algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

/*
 小知识：
        > 是开发设计模式（共23种）中的1种
        > 它可以保证在程序运行过程，一个类只有一个实例(一个对象)，而且该实例易于供外界访问，从而方便地控制了实例个数，并节约系统资源
        > 使用场合：在整个应用程序中，共享一份资源（这份资源只需要创建初始化1次）
 
 实例：
        > UIApplication(应用程序实例)
        > NSNotificationCenter(消息中心)
        > NSFileManager(文件管理)
        > NSUserDefaults(应用程序设置)
        > NSURLCache(请求缓存)
        > NSHTTPCookieStorage(应用程序cookies池)
 */

// 在.h文件使用的宏定义来实现ARC和MRC定义。多防御pch包含的子文件中
#define MYSingletonH(name) + (instancetype)shared##name;

#if __has_feature(objc_arc)
// 当前的编译器环境是ARC
// 在.m文件使用的宏定义
#define MYSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else
// 当前的编译器环境是MRC
// 在.m文件使用的宏定义
#define MYSingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
- (oneway void)release {} \
- (id)retain {return self;} \
- (NSUInteger)retainCount {return 1;} \
- (id)autorelease {return self;}
#endif


#import <Foundation/Foundation.h>

@interface SingletonMethod : NSObject <NSCopying>

@end
