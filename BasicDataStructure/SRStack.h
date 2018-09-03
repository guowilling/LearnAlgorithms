//
//  SRStack.h
//  LearnDataStructure
//
//  Created by 郭伟林 on 2018/8/31.
//  Copyright © 2018年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 栈, 先进后出
 */
@interface SRStack<ObjectType> : NSObject

+ (instancetype)stack;
+ (instancetype)stackWithCapacity:(NSInteger)numItems;
- (instancetype)initWithCapacity:(NSInteger)numItems;

- (void)push:(ObjectType)obj;
- (ObjectType)pop;
- (void)removeAllObjects;

@property (nonatomic,assign,readonly) NSInteger size;

@property (nonatomic,assign,getter=isEmpty) BOOL empty;

@end
