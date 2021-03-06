//
//  ViewController.m
//  SearchingAlgorithm
//
//  Created by 郭伟林 on 17/3/23.
//  Copyright © 2017年 SR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - sequenceSearch O(n)

int sequenceSearch(int array[], int arrayLength, int key)
{
    int index = arrayLength - 1;
    while (index != -1 && array[index] != key) {
        index--;
    }
    return index;
}

#pragma mark - binarySearch O(n)

int binarySearch(int array[], int arrayLength, int key)
{
    int left = 0;
    int right = arrayLength - 1;
    while (left < right) {
        int middle = (left + right) / 2;
        if (array[middle] == key) {
            return middle;
        } else if (array[middle] > key) {
            right = middle - 1;
        } else {
            left = middle + 1;
        }
    }
    return -1;
}

#pragma mark - quickSort O(nlogn)

void quickSort(int array[], int left, int right)
{
    if (left >= right) {
        return;
    }
    int pivotPosition = quickSortPartition(array, left, right);
    quickSort(array, left, pivotPosition - 1);
    quickSort(array, pivotPosition + 1, right);
}

int quickSortPartition(int array[], int left, int right)
{
    int pivotKey = left;
    int pivotValue = array[left];
    while (left < right) {
        while (left < right && array[right] >= pivotValue) {
            right--;
        }
        while (left < right && array[left] <= pivotValue) {
            left++;
        }
        swap(array, left, right);
    }
    swap(array, pivotKey, left);
    return left;
}

void swap(int array[], int i, int j)
{
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

#pragma mark - 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        // sequenceSearch
        int array[] = {5, 95, 15, 85, 25, 75, 35, 65, 45, 55};
        int arrayLength = sizeof(array) / sizeof(int);
        printf("sequenceSearch: %d", sequenceSearch(array, arrayLength, 55));
    }
    
    printf("\n");
    
    {
        // binarySearch
        int array[] = {5, 95, 15, 85, 25, 75, 35, 65, 45, 55};
        int arrayLength = sizeof(array) / sizeof(int);
        quickSort(array, 0, arrayLength - 1);
        for (int i = 0; i < arrayLength; i++) {
            printf("%d ", array[i]);
        }
        printf("binarySearch: %d", binarySearch(array, arrayLength, 55));
    }
}

#pragma mark - 查找两个子视图的共同父视图

- (NSArray<UIView *> *)findCommonSuperView:(UIView *)viewOne other:(UIView *)viewOther {
    NSMutableArray *result = [NSMutableArray array];
    
    // 第一个视图的所有父视图
    NSArray *superViewsOne = [self superViewsOfView:viewOne];
    // 第二个视图的所有父视图
    NSArray *superViewsOther = [self superViewsOfView:viewOther];
    
    int i = 0;
    while (i < MIN(superViewsOne.count, superViewsOther.count)) { // 越界限制条件
        // 倒序获取各个视图的父视图
        UIView *superOne = [superViewsOne objectAtIndex:superViewsOne.count - i - 1];
        UIView *superOther = [superViewsOther objectAtIndex:superViewsOther.count - i - 1];
        if (superOne == superOther) { // 如果相等则为共同父视图
            [result addObject:superOne];
            i++;
        } else {
            break; // 如果不相等则结束遍历
        }
    }
    return result;
}

- (NSArray <UIView *> *)superViewsOfView:(UIView *)view {
    UIView *superview = view.superview;
    NSMutableArray *result = [NSMutableArray array];
    while (superview) {
        [result addObject:superview];
        superview = superview.superview;
    }
    return result;
}

@end
