//
//  SRQueue.h
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/31.
//  Copyright © 2018年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 队列, 先进先出
 */
@interface SRQueue<ObjectType> : NSObject

+ (instancetype)queue;
+ (instancetype)queueWithCapacity:(NSInteger)numItems;
- (instancetype)initWithCapacity:(NSInteger)numItems;

- (void)enqueue:(ObjectType)obj;
- (id)dequeue;
- (void)removeAllObjects;

@property (nonatomic, weak) ObjectType firstObject;

@property (nonatomic, assign, readonly) NSInteger size;

@property (nonatomic, assign, getter=isEmpty) BOOL empty;

@end
