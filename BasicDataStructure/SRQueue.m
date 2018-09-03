//
//  SRQueue.m
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/31.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "SRQueue.h"
#import "SRMutableArray.h"

@interface SRQueue () {
    SRMutableArray *_arrayM;
}

@end

@implementation SRQueue

+ (instancetype)queue {
    return [self queueWithCapacity:10];
}

+ (instancetype)queueWithCapacity:(NSInteger)numItems {
    return [[self alloc] initWithCapacity:numItems];
}

- (instancetype)initWithCapacity:(NSInteger)numItems {
    if (self = [super init]) {
        _arrayM = [SRMutableArray arrayWithCapacity:numItems];
    }
    return self;
}

- (void)enqueue:(id)obj {
    [_arrayM addObject:obj];
}

- (id)dequeue {
    id obj = _arrayM.firstObject;
    [_arrayM removeObjectAtIndex:0];
    return obj;
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
    [des appendFormat:@"SRQueue: %p \n", self];
    [des appendString:@"front [ "];
    for (int i = 0; i < _arrayM.count; i++) {
        id object = [_arrayM objectAtIndex:i];
        [des appendFormat:@"%@", object];
        if (i != _arrayM.count - 1) {
            [des appendString:@" , "];
        }
    }
    [des appendString:@" ] tail "];
    return des;
}

@end
