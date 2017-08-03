//
//  BinaryTreeNode.h
//  BinaryTree
//
//  Created by 郭伟林 on 2017/8/3.
//  Copyright © 2017年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic, assign) NSInteger value;

@property (nonatomic, strong) BinaryTreeNode *leftNode;

@property (nonatomic, strong) BinaryTreeNode *rightNode;

@end
