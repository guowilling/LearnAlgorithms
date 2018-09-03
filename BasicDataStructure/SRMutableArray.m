//
//  SRMutableArray.m
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/30.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "SRMutableArray.h"

static NSUInteger const defaultCapacity = 5;

typedef void * AnyObject;

@interface SRMutableArray () {
    AnyObject *_arrayM;
    
    NSUInteger _capacity;
    
    NSUInteger _size;
}

@end

@implementation SRMutableArray

- (void)dealloc {
    if (_arrayM != NULL) {
        NSInteger i = _size - 1;
        while (i >= 0) {
            AnyObject *obj = _arrayM[i];
            if (obj != NULL) {
                CFRelease(obj);
            }
            i--;
        }
        free(_arrayM);
    }
}

- (instancetype)init {
    if (self = [super init]) {
        _capacity = defaultCapacity;
        _size = 0;
        _arrayM = (AnyObject *)calloc(_capacity, sizeof(AnyObject));
    }
    return self;
}

+ (instancetype)array {
    return [[self alloc] initWithCapacity:defaultCapacity];
}

+ (instancetype)arrayWithCapacity:(NSUInteger)numItems {
    return [[self alloc] initWithCapacity:numItems];
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    _capacity = numItems;
    _size = 0;
    _arrayM = calloc(_capacity, sizeof(AnyObject));
    return self;
}

#pragma mark - 查询操作

- (BOOL)isEmpty {
    return (_size == 0);
}

- (BOOL)isFull {
    return (_size == _capacity - 1);
}

- (id)objectAtIndex:(NSUInteger)index {
    if ((index > _size)) {
        @throw [NSException exceptionWithName:@"Array is out of bounds" reason:@"out of bounds" userInfo:nil];
    }
    if ([self isEmpty]) {
        return nil;
    }
    AnyObject obj = _arrayM[index];
    if (obj == NULL) {
        return nil;
    }
    return (__bridge id)(obj);
}

- (NSUInteger)indexOfObject:(id)anObject {
    for (int i = 0; i<_size; i++) {
        id obj = (__bridge id)(_arrayM[i]);
        if ([anObject isEqual:obj]) {
            return i;
        }
    }
    return NSNotFound;
}

- (BOOL)containsObject:(id)anObject {
    for (int i = 0; i<_size; i++) {
        id obj = (__bridge id)(_arrayM[i]);
        if ([anObject isEqual:obj]) {
            return YES;
        }
    }
    return NO;
}

- (id)firstObject {
    if ([self isEmpty]) {
        return nil;
    }
    return (__bridge id _Nullable)(_arrayM[0]);
}

- (id)lastObject {
    if ([self isEmpty]) {
        return nil;
    }
    return (__bridge id _Nullable)(_arrayM[_size-1]);
}

- (NSUInteger)count {
    return _size;
}

#pragma mark - 增加操作

- (void)addObject:(id)anObject {
    [self insertObject:anObject atIndex:_size];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        @throw [NSException exceptionWithName:@"anObject is null" reason:@"object must be not null" userInfo:nil];
    }
    if ((index > _size)) {
        @throw [NSException exceptionWithName:@"Array is out of bounds" reason:@"out of bounds" userInfo:nil];
    }
    if (_size == _capacity) {
        [self resizeWithCapacity:2 * _capacity];
    }
    if (self.count > 0 ) {
        for (NSInteger i = _size - 1; i >= index; i--) {
            _arrayM[i + 1] = _arrayM[i];
        }
    }
    _arrayM[index] = (__bridge_retained AnyObject)(anObject);
    _size++;
}

- (void)resizeWithCapacity:(NSInteger)capacity {
    _capacity = capacity;
    AnyObject *oldArray = _arrayM;
    AnyObject *newArray = (AnyObject *)calloc(_capacity, sizeof(AnyObject));
    size_t size = sizeof(AnyObject) * self.count;
    memcpy(newArray, oldArray, size);
    _arrayM = newArray;
    if (oldArray != NULL) {
        free(oldArray);
        oldArray = NULL;
    }
}

#pragma mark - 删除操作

- (void)removeAllObjects {
    AnyObject *oldArray = _arrayM;
    NSInteger i = _size - 1;
    while (i >= 0) {
        AnyObject *obj = oldArray[i];
        CFRelease(obj);
        i--;
    }
    if (oldArray != NULL) {
        free(oldArray);
        oldArray = NULL;
    }
    _size = 0;
    _capacity = defaultCapacity;
    _arrayM = (AnyObject *)calloc(_capacity, sizeof(AnyObject));
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    if ((index > _size)) {
        @throw [NSException exceptionWithName:@"Array is out of bounds" reason:@"out of bounds" userInfo:nil];
    }
    AnyObject object = (_arrayM[index]);
    CFRelease(object);
    for (NSInteger i = index + 1; i < _size; i ++) {
        _arrayM[i - 1] = _arrayM[i];
    }
    _size--;
    _arrayM[_size] = NULL;
    if (_size == _capacity * 0.25 && (_capacity * 0.25 != 0)) {
        [self resizeWithCapacity:_capacity / 2];
    }
}

- (void)removeObject:(id)anObject {
    NSInteger index = [self indexOfObject:anObject];
    if (index == NSNotFound) {
        return;
    }
    [self removeObjectAtIndex:index];
}

- (void)removeLastObject {
    if ([self isEmpty]) {
        return;
    }
    [self removeObjectAtIndex:_size-1];
}

#pragma mark - 修改操作

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (!anObject) {
        @throw [NSException exceptionWithName:@"anObject is null" reason:@"object must be not null" userInfo:nil];
    }
    if ((index > _size)) {
        @throw [NSException exceptionWithName:@"Array is out of bounds" reason:@"out of bounds" userInfo:nil];
    }
    _arrayM[index] = (__bridge AnyObject)(anObject);
}

- (SRMutableArray *)deepCopyArray {
    AnyObject *oldArray = _arrayM;
    SRMutableArray *newArray = [SRMutableArray arrayWithCapacity:_capacity];
    size_t size = sizeof(AnyObject) * _capacity;
    memcpy(newArray->_arrayM, oldArray, size);
    return newArray;
}

- (NSString *)description {
    NSMutableString *des = [NSMutableString stringWithFormat:@"\nSRMutableArray %p : [ \n", self];
    for (int i = 0; i < _size; i++) {
        AnyObject obj = _arrayM[i];
        [des appendFormat:@"%@", (__bridge id)obj];
        if (i < _size - 1) {
            [des appendString:@" , \n"];
        }
    }
    [des appendString:@"\n]\n"];
    return des;
}

@end
