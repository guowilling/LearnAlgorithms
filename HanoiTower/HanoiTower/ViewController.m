//
//  ViewController.m
//  HanoiTower
//
//  Created by 郭伟林 on 2017/6/5.
//  Copyright © 2017年 SR. All rights reserved.
//

#import "ViewController.h"
#import "HanoiTower.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [HanoiTower move:3 withA:@"One" withB:@"Two" withC:@"Three"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
