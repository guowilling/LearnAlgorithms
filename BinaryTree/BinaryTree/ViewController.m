//
//  ViewController.m
//  BinaryTree
//
//  Created by 郭伟林 on 2017/8/3.
//  Copyright © 2017年 SR. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    BinaryTreeNode *binaryTreeNode = [[self class] createTreeWithValues:@[@4, @2, @7, @1, @3, @6, @5]];
    NSLog(@"binaryTreeNode: %@", binaryTreeNode);
    
    binaryTreeNode = [[self class] invertBinaryTreeRecursive:binaryTreeNode];
    NSLog(@"invertBinaryTreeNode: %@", binaryTreeNode);
}

+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values {
    
    BinaryTreeNode *node = nil;
    for (NSInteger i = 0; i < values.count; i++) {
        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
        node = [[self class] addTreeNode:node value:value];
    }
    return node;
}

+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)node value:(NSInteger)value {
    
    if (!node) { // 如果根节点不存在, 则该节点成为根节点
        node = [BinaryTreeNode new];
        node.value = value;
    } else if (value <= node.value) { // 值小于根节点, 插入到左子树
        node.leftNode = [[self class] addTreeNode:node.leftNode value:value];
    } else { // 值大于根节点, 插入到右子树
        node.rightNode = [[self class] addTreeNode:node.rightNode value:value];
    }
    return node;
}

/**
 反转二叉树(递归方式)
 */
+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return nil;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return rootNode;
    }
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    BinaryTreeNode *tempNode = rootNode.leftNode;
    rootNode.leftNode = rootNode.rightNode;
    rootNode.rightNode = tempNode;
    return rootNode;
}

/**
 反转二叉树(非递归方式)
 */
+ (BinaryTreeNode *)invertBinaryTreeRecursive:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return nil;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return rootNode;
    }
    NSMutableArray *queueArray = [NSMutableArray array]; // 数组作为队列
    [queueArray addObject:rootNode]; // 压入根节点
    while (queueArray.count > 0) {
        BinaryTreeNode *node = [queueArray firstObject];
        [queueArray removeObjectAtIndex:0]; // 弹出最前面的节点, 队列先进先出原则
        BinaryTreeNode *pLeft = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = pLeft;
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    return rootNode;
}

/**
 二叉树搜索
 */
+ (BinaryTreeNode *)searchTreeNodeWithValue:(NSInteger)value inTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return nil;
    }
    if (rootNode.value == value) {
        return rootNode;
    }
    if (value < rootNode.value) {
        return [self searchTreeNodeWithValue:value inTree:rootNode.leftNode];
    } else {
        return [self searchTreeNodeWithValue:value inTree:rootNode.rightNode];
    }
}

/**
 先序遍历 DLR
 */
+ (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler {
    
    if (!rootNode) {
        return;
    }
    if (handler) {
        handler(rootNode);
    }
    [self preOrderTraverseTree:rootNode.leftNode handler:handler];
    [self preOrderTraverseTree:rootNode.rightNode handler:handler];
}

/**
 中序遍历 LDR
 */
+ (void)inOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *treeNode))handler {
    
    if (!rootNode) {
        return;
    }
    [self inOrderTraverseTree:rootNode.leftNode handler:handler];
    if (handler) {
        handler(rootNode);
    }
    [self inOrderTraverseTree:rootNode.rightNode handler:handler];
}

/**
 后序遍历 LRD
 */
+ (void)postOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler {
    
    if (!rootNode) {
        return;
    }
    [self postOrderTraverseTree:rootNode.leftNode handler:handler];
    [self postOrderTraverseTree:rootNode.rightNode handler:handler];
    if (handler) {
        handler(rootNode);
    }
}

/**
 广度优先遍历 Breadth First Search
 */
+ (void)breadthTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler {
    
    if (!rootNode) {
        return;
    }
    NSMutableArray *queueArray = [NSMutableArray array]; // 数组当成队列
    [queueArray addObject:rootNode]; // 压入根节点
    while (queueArray.count > 0) {
        BinaryTreeNode *node = [queueArray firstObject];
        if (handler) {
            handler(node);
        }
        [queueArray removeObjectAtIndex:0]; // 弹出最前面的节点, 队列先进先出原则
        if (node.leftNode) {
            [queueArray addObject:node.leftNode]; // 压入左节点
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode]; // 压入右节点
        }
    }
}

/**
 深度优先遍历 Depth First Search
 */
+ (void)depthTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler {
    
    if (!rootNode) {
        return;
    }
    if (handler) {
        handler(rootNode);
    }
    [self depthTraverseTree:rootNode.leftNode handler:handler];
    [self depthTraverseTree:rootNode.rightNode handler:handler];
}

@end
