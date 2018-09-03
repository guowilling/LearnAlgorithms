//
//  SRMutableArray.h
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/30.
//  Copyright © 2018年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRMutableArray<ObjectType> : NSObject

@property (readonly) NSUInteger count;
@property (nullable, nonatomic, readonly) ObjectType firstObject;
@property (nullable, nonatomic, readonly) ObjectType lastObject;

+ (instancetype)array;
+ (instancetype)arrayWithCapacity:(NSUInteger)numItems;
- (instancetype)initWithCapacity:(NSUInteger)numItems;

- (ObjectType)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(ObjectType)anObject;
- (BOOL)containsObject:(ObjectType)anObject;

- (void)addObject:(ObjectType)anObject;
- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

- (void)removeAllObjects;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObject:(ObjectType)anObject;

- (SRMutableArray *)deepCopyArray;

@end
