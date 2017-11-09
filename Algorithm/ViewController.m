//
//  ViewController.m
//  Algorithm
//
//  Created by swift on 2017/11/9.
//  Copyright © 2017年 王家伟. All rights reserved.
//

#import "ViewController.h"
#import "Tree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Tree *tree = [[Tree alloc] init:@"root"];
    
    Tree *left = [[Tree alloc] init:@"left"];
    Tree *right = [[Tree alloc] init:@"right"];
    
    [tree addChild:left];
    [tree addChild:right];
    
    NSLog(@"%@", tree);
    NSLog(@"%@", left);
    NSLog(@"%@", right);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
