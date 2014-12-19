//
//  BitVector.h
//
//  Created by kekey on 14/12/19.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BitVector : NSObject

//向量的长度
@property(nonatomic,readonly)NSUInteger length;

/**
 *  根据指定长度初始化一个位向量
 *
 *  @param length 向量长度
 *
 *  @return 位向量对象
 */
- (instancetype)initWithVectorLenght:(NSUInteger)length;

/**
 *  设置index位为1
 *
 *  @param index 位向量的下标
 */
- (void)setBitAtIndex:(NSUInteger)index;

/**
 *  设置index位为0
 *
 *  @param index 位向量的下标
 */
- (void)clearBitAtIndex:(NSUInteger)index;

/**
 *  获取index位的值(1 or 0)
 *
 *  @param index 位向量的下标
 *
 *  @return 1 or 0
 */
- (int)getBitAtIndex:(NSUInteger)index;

/**
 *  切换index位置的值 0-->1 or 1-->0
 *
 *  @param index 位向量的下标
 */
- (void)toggleBitAtIndex:(NSUInteger)index;

@end
