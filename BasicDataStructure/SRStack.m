//
//  SRStack.m
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/31.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "SRStack.h"
#import "SRMutableArray.h"

@interface SRStack () {
    SRMutableArray *_arrayM;
}

@end

@implementation SRStack

+ (instancetype)stack {
    return [[self alloc] initWithCapacity:10];
}

+ (instancetype)stackWithCapacity:(NSInteger)numItems {
    return [[self alloc] initWithCapacity:numItems];
}

- (instancetype)initWithCapacity:(NSInteger)numItems {
    if (self = [super init]) {
        _arrayM = [SRMutableArray arrayWithCapacity:numItems];
    }
    return self;
}

- (void)push:(id)obj {
    [_arrayM addObject:obj];
}

- (id)pop {
    id object = [_arrayM lastObject];
    [_arrayM removeObject:object];
    return object;
}

- (void)removeAllObjects {
    [_arrayM removeAllObjects];
}

- (NSInteger)size {
    return _arrayM.count;
}

- (BOOL)isEmpty {
    return _arrayM.count == 0;
}

- (NSString *)description {
    NSMutableString *des = [NSMutableString string];
    [des appendFormat:@"SRStack: %p \n", self];
    [des appendString:@" [ "];
    for (int i = 0; i < _arrayM.count; i++) {
        id object = [_arrayM objectAtIndex:i];
        [des appendFormat:@"%@", object];
        if (i != _arrayM.count - 1) {
            [des appendString:@" , "];
        }
    }
    [des appendString:@" ] top "];
    return des;
}

@end
