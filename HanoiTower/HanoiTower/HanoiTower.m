//
//  HanoiTower.m
//  HanoiTower
//
//  Created by 郭伟林 on 2017/6/5.
//  Copyright © 2017年 SR. All rights reserved.
//

#import "HanoiTower.h"

@implementation HanoiTower

+ (void)move:(NSInteger)N withA:(NSString *)A withB:(NSString *)B withC:(NSString *)C {
    
    if (N == 1) {
        NSLog(@"Move disk %ld from %@ to %@\n", N, A, C);
    } else {
        [self move:(N - 1) withA:A withB:C withC:B];
        NSLog(@"Move disk %ld from %@ to %@\n", N, A, C);
        [self move:(N - 1) withA:B withB:A withC:C];
    }
}

@end
